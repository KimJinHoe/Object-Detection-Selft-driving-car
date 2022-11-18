#!/usr/bin/env python
import cv2
import numpy as np

class LineCar:
    def __init__(self):
        self.cam = None
        self.img = None
        self.steer = 0

    def set_cam(self, _index):
        self.cam = cv2.VideoCapture(0)

    def detect_line(self, _steer):
        ret, self.img = self.get_image(self.cam, 1)
        rate = 1
        try:
            while ret:
                #cv2.imshow("original", self.img)
                lines = self.recognition()
                self.judgement(lines)
                ret, self.img = self.get_image(self.cam, 1)
                _steer.value = self.steer
                if cv2.waitKey(1) & 0xff == ord('q'):
                    _steer.value = -101
                    break
            cv2.destroyAllWindows()
        except:
            cv2.destroyAllWindows()
            return

    def recognition(self):
        self.img = cv2.GaussianBlur(self.img, (5, 5), -1)

        temp = self.roi_image(self.img)
	

        hsv = cv2.cvtColor(temp, cv2.COLOR_BGR2HSV)
        low_val = (39, 0, 184)
        high_val = (221, 255, 255)

        #low_val = (100, 220, 80)
        #high_val = (120, 255, 255)

        mask = cv2.inRange(hsv, low_val, high_val)

        #bgr_low = (150, 150, 150)
        #bgr_high = (255, 255, 255)
        #mask = cv.inRange(temp, bgr_low, bgr_high)
        #cv2.imshow("ROI", mask)

        canny = cv2.Canny(mask, 75, 150)
        cv2.imshow("Canny", canny)

        lines = cv2.HoughLinesP(canny, 1, float(3.14)/float(180),
                                40, minLineLength=30, maxLineGap=50)

        return lines

    def judgement(self, _lines):
        if _lines is not None:
            _lines = self.calc_line_axis(self.img, _lines)
            if _lines is not None:
                result = self.draw_line(_lines)
                cv2.imshow("draw line", result)
        else:
            self.steer = -99

    def cam_setting(self, _op=1):
        if _op == 0:
            self.cam.set(3, 800)
            self.cam.set(4, 448)
        else:
            pass

    @staticmethod
    def get_image(_dir, _op=0):
        if _op == 0:
            return cv2.imread(_dir)
        else:
            ret, img = _dir.read()
            if ret:
                img = cv2.resize(
                    img,
                    dsize=(0, 0),
                    fx=0.8,
                    fy=0.8,
                    interpolation=cv2.INTER_LINEAR
                )
            return ret, img

    @staticmethod
    def roi_image(_image):
        height = _image.shape[0]
        width = _image.shape[1]
        roi = [
            (0, height),
            (0, height / 2),
            (width, height / 2),
            (width, height)
        ]

        vertices = np.array([roi], np.int32)
        mask = np.zeros_like(_image)

        match_mask_color = 255*3
        cv2.fillPoly(mask, vertices, match_mask_color)
        masked_image = cv2.bitwise_and(_image, mask)
        
        return masked_image

    def draw_line(self, points):
        height = self.img.shape[0]
        width = self.img.shape[1]

        if len(points) == 2:
            _, _, left_x2, _ = points[0][0]
            _, _, right_x2, _ = points[1][0]
            mid = int(width / float(2))
            if left_x2 > width * 2 / 3 or right_x2 < width / 3:
                if left_x2 > width * 2 / 3:
                    base_x = left_x2 - (width / 2)
                elif right_x2 < width / 3:
                    base_x = width / 2 - right_x2
                base_y = int(height / 2)
                result = self.base_line(1, base_x, base_y)
            else:
                base_x = int(left_x2 + right_x2) / 2 - float(mid)
                base_y = int(height / float(2))

                result = self.base_line(2, base_x, base_y)

        elif len(points) == 1:
            x1, _, x2, _ = points[0][0]

            base_x = x2 - x1
            base_y = int(height / float(2))
            result = self.base_line(1, base_x, base_y)

        else:
            base_x = width / float(2)
            result = self.base_line(0, base_x, height)

        for point in points:
            x1, y1, x2, y2 = point[0]
            cv2.line(result, (x1, y1), (x2, y2), (0, 255, 0), 4)

        return result

    def base_line(self, _num, _x, _y):
        height = self.img.shape[0]
        width = self.img.shape[1]

        mid_rad = np.arctan(_x / float(_y))

        mid_deg = int(mid_rad * 180 / np.pi)
        self.stablize_deg(_num, mid_deg)

        temp = self.steer + 90
        ofc_rad = temp / 180 * np.pi

        x1 = int(width / float(2))
        y1 = height

        if ofc_rad == 0:
            x2 = int(width / float(2))
        else:
            x2 = int(x1 - height / 2 / float(np.tan(ofc_rad)))

        y2 = int(height / float(2))

        temp = self.img.copy()

        cv2.line(temp, (x1, y1), (x2, y2), (0, 255, 255), 4)

        return temp

    def stablize_deg(self, _num, _calc_deg):
        max_angle = 0

        if self.steer == -99:
            self.steer = 0

        if _num > 0:
            max_angle = 4
        else:
            return 0

        deg_offset = _calc_deg - self.steer
        if abs(deg_offset) > max_angle:
            self.steer = int(
                self.steer + max_angle * deg_offset / abs(deg_offset)
            )

        if self.steer > 25:
            self.steer = 25
        elif self.steer < -25:
            self.steer = -25

    def calc_line_axis(self, _img, lines):
        width = _img.shape[1]

        lane_lines = []

        left_fit = []
        right_fit = []

        boundary = 2 / float(3)
        left_region_boundary = width * (1 - float(boundary))
        right_region_boundary = width * float(boundary)

        for line in lines:
            for x1, y1, x2, y2 in line:
                if x1 == x2:
                    continue
                fit = np.polyfit((x1, x2), (y1, y2), 1)
                slope = fit[0]
                intercept = fit[1]

                if slope < 0:
                    if x1 < left_region_boundary:
                        left_fit.append((slope, intercept))
                elif slope > 0:
                    if x1 > right_region_boundary:
                        right_fit.append((slope, intercept))
                else:
                    pass

        if len(left_fit) > 0:
            left_fit_average = np.average(left_fit, axis=0)
            lane_lines.append(self.make_points(_img, left_fit_average))
        if len(right_fit) > 0:
            right_fit_average = np.average(right_fit, axis=0)
            lane_lines.append(self.make_points(_img, right_fit_average))

        return lane_lines if len(lane_lines) > 0 else None

    @staticmethod
    def make_points(_img, line):
        height, width, _ = _img.shape
        slope, intercept = line
        y1 = height
        y2 = int(y1 / 2)

        if slope == 0:
            slope = 0.0000001
        x1 = max(-width, min(2 * width, int((y1 - intercept) / slope)))
        x2 = max(-width, min(2 * width, int((y2 - intercept) / slope)))

        return [[x1, y1, x2, y2]]

def run_line_detect(_steer):
    run_car = LineCar()
    run_car.set_cam(1)
    run_car.cam_setting(0)
    run_car.detect_line(_steer)

if __name__ == '__main__':
    from multiprocessing import Process, Manager
    import ctypes


    gflag = Manager().Value(ctypes.c_int8, -3)

    run_car = Process(target=run_line_detect, args=(gflag,))
    run_car.daemon = True
    run_car.start()

    while True:
        print(gflag.value)

    
