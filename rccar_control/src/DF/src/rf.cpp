#include "DF/rf.h"

rf::rf()
{
        for(int i = 0; i < 3; i++)
        {
                axes[i] = {0};
                axes_output[i] = {0};
        }

        for(int i = 0; i < 11; i++)
        {
                but_output[i] = 0;
        }

                device_path = "/dev/input/js0";
                js = open(device_path, O_RDONLY);

        if (js == -1)
                perror("Could not open joystick");

        std::thread m_thread(&rf::m_run, this);
        m_thread.detach();
        //m_thread.join();
}

rf::~rf()
{

}

void rf::m_run()
{
        while(read_event(js, &event) == 0)
        {
                switch (event.type)
                {
                        case JS_EVENT_BUTTON:
                                //printf("Button %u %s\n", event.number, event.value ? "pressed" : "released");
                                but_output[event.number] = event.value;
                                break;
                        case JS_EVENT_AXIS:
                                axis = get_axis_state(&event, axes);
                                if (axis < 3)
                                {
                                        axes_output[axis].x = axes[axis].x;
                                        axes_output[axis].y = axes[axis].y;
                                        //printf("Axis %zu at (%6d, %6d)\n", axis, axes[axis].x, axes[axis].y);
                                }
                                break;
                        default:
                                break;
                }

                fflush(stdout);
        }
        close(js);
}


int rf::get_axis(int num, bool ax)
{
        if(ax == 0)
                return axes_output[num].x;
        if(ax == 1)
                return axes_output[num].y;
}

bool rf::get_button(int num)
{
        return but_output[num];
}

int rf::read_event(int fd, struct js_event *event)
{
    ssize_t bytes;

    bytes = read(fd, event, sizeof(*event));

    if (bytes == sizeof(*event))
        return 0;

    return -1;
}

size_t rf::get_axis_count(int fd)
{
    __u8 axes;

    if (ioctl(fd, JSIOCGAXES, &axes) == -1)
        return 0;

    return axes;
}

size_t rf::get_button_count(int fd)
{
    __u8 buttons;
    if (ioctl(fd, JSIOCGBUTTONS, &buttons) == -1)
        return 0;

    return buttons;
}

size_t rf::get_axis_state(struct js_event *event, struct axis_state axes[3])
{
    size_t axis = event->number / 2;

    if (axis < 3)
    {
        if (event->number % 2 == 0)
            axes[axis].x = event->value;
        else
            axes[axis].y = event->value;
    }

    return axis;
}


