# AI 사물인식 자율주행자동차 (졸업작품)

<center><img src="https://user-images.githubusercontent.com/103913683/184589933-ff56add8-f8b2-46fd-84bf-aae1b942d828.png"></center>

## 1. 프로젝트 개요
- 개발기간 : 2019.11.01 ~ 2020.06.30
- 수상 : 캡스톤 디자인 대상 (60여 팀 중 1등)
- 참여인원 : 3명
- 소개 : 사람과 표지판을 인식하는 AI 사물인식 자율주행자동차
    - 조이스틱 수동조작
    - 차선인식
    - 사물인식
    - GPS 위치 파악 및 웹 확인
- 일정 </br>
![image](https://user-images.githubusercontent.com/103913683/184660178-6b3e7bcc-828d-45d9-8ffb-f2ed1768ca16.png)


## 2. 사용 기자재 및 소프트웨어 기술
### 사용 기자재
- NVIDIA Jetson AGX Xavier - 차량 제어
- Raspberry Pi 4 - 사물 인식
- Google Coral USE Accelerator (Edge Tpu) - 사물인식
- 로지텍 Web Cam (C920) - 사물인식 및 차선 인식
- Traxxas Slash 4X4 - 차체
- GPS module (EM-406A) - 차량 위치 파악

### 소프트웨어 및 사용 기술
- ROS melodic
- Jetpack 4.3
- Tensorflow Lite
- Opencv 4.3 (Jetson) / Opencv 4.5 (Rassberry Pi)
- Python 3.6.9
- Node.js 14.17.0

## 3. 프로젝트 설계
- 전체 기능 구조</br>
![image](https://user-images.githubusercontent.com/103913683/184658274-dc79c36f-401e-4882-a9a9-08460b2b5352.png)
- 차량 기능 구조
  - DMF (Drive Management Function)
    - 차선, 객체, 속도 정보 등을 통한 주행 관리
  - DF (Drive Function)
    - 모터 관련 차량 제어 기능
  - LF (LocalizationFunction)
    - 차량의 위치 인식 기능
  - CI (Communication Interface)
    - Server와의 UDP 통신</br>
![image](https://user-images.githubusercontent.com/103913683/184658625-4ffb65c5-f1d2-4fd8-ac8b-d39ef559f7bb.png)

## 4. 담당한 기능
대표기능 : 사람과 표지판을 인식하고 차량을 제어하는 사물인식 기능
- 사람 및 표지판 학습
- 사람 및 표지판 인식 후, 차량에 데이터를 넘겨 차체 제어 (라즈베리파이 -> 젯슨보드)
- 사람 및 정지-멈춤, 30 및 50 속도제한-속도조절

## 5. 시연영상
- [GPS 주행 테스트](https://youtu.be/mS-XMv0DXyI)
- [실내 진입금지후 STOP 표지판 테스트1](https://youtu.be/ezSZCGsHeOE)
- [실내 진입금지후 STOP 표지판 테스트2](https://youtu.be/VZLbV189xVc)
- [실내 사람(이미지) 인식 테스트](https://youtu.be/fWBu_FuCiHA)
- [실외 트랙 주행 테스트](https://youtu.be/rxKsBFIYjmE)

## 6. 회고
### 문제점 및 개선방안
1. 사양 문제
> tensorflow를 이용한 사물 인식 기능은 라즈베리파이, 그 외 기능은 젯슨보드에서 구현하였다. 라즈베리파이4로 사물인식(객체인식) 기능은 FPS 3정도로 정상 작동이 불가능했다. 문제를 해결하기 위해 여러 방법을 사용해보았다.<br>
    1) 저사양 tflite파일로 변환하기 -> 동일하게 느린 속도<br>
    2) 젯슨 보드에 사물인식 알고리즘 구현 -> 기존 코드와의 충돌, 기기 동시 개발 문제<br>
    3) 데크스탑(혹은 노트북)으로의 데이터 전송 및 알고리즘 실행 후, 결과 데이터 리턴 -> 느린 차량 반응속도<br><br>
결국 문제 해결에 많은 시간이 소요됐지만, 포기하지 않고 계속해서 해결방안을 모색했고 결국 Google Coral AI 엑셀러레이터라는 기기를 접하게 되었다. 저사양 컴퓨터에서도 AI 기능을 사용할 수 있게 해주는 사양 보조 기기였다. 기기를 장착 후, 기기에 맞춰 학습 파일을 변환해주자 기존 FPS 3에서 FPS 40~50으로 성능이 향상되었고, 무사히 프로젝트를 마무리 지을 수 있었다.
2. 환경 문제
> 초기에는 차량 주행을 실내가 아닌 실외에서 진행했는데 외부환경에 대한 영향이 크게 작용했다. 카메라를 통해 차선 인식·사물인식을 진행하다 보니 일조량에 따라 차선인식이 정상적으로 동작하지 않아 차량이 트랙을 주행 중 경로 이탈하는 경우가 발생하였고 사물인식 또한 일조량에 따라 정확도의 차이가 발생하였다. 경로 이탈의 주요 원인은 차선인식을 명암대비로 진행하게 되는데 일조량이 많을 경우 바닥면에서 빛이 반사되어 차선보다 주변이 명도가 높게 측정이 되는 것이 원인이다.<br><br>
외부 환경에 따라 카메라의 설정을 변경하여 연구 목표 1단계를 완료하고 표지판 및 사람을 인식하여 진행하는 부분은 실내에서 진행하였다. 카메라 설정을 HSV를 통해 외부환경에 맞춰주고 일정 기울기 이상의 직선은 인식되지 않게 Lane detection 소스코드를 수동적으로 변경하였다. 매번 실외에서 설정을 수동적으로 변경하지 않고 기상청의 데이터를 수집하거나 조도센서 등을 이용하여 날씨나 빛의 세기에 따라 미리 설정 값을 지정하면 개선이 가능할 것으로 예상된다. 사물인식 역시 이와 같은 방법으로 개선이 가능할 것이다.
