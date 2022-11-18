# Capstone-Design-Graduation-Project

<center><img src="https://user-images.githubusercontent.com/103913683/184589933-ff56add8-f8b2-46fd-84bf-aae1b942d828.png"></center>

## 1. 프로젝트 개요
- 개발기간 : 2019.11.01 ~ 2020.06.30
- 참여인원 : 3명
- 소개 : 자율주행 RC Car - 차선인식, 사물인식, GPS 위치 파악
- 일정 </br>
![image](https://user-images.githubusercontent.com/103913683/184660178-6b3e7bcc-828d-45d9-8ffb-f2ed1768ca16.png)


## 2. 사용 기자재 및 소프트웨어 기술
### 사용 기자재
- NVIDIA Jetson AGX Xavier - 차량 제어
- Raspberry Pi 4 - 사물 인식
- Traxxas Slash 4X4 - 차체
- 로지텍 Web Cam (C920) - 사물인식 및 차선 인식
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
대표기능 : GPS를 활용한 차량의 위치 확인
- GPS 모듈과 NMEA 프로토콜 (GPGGA/GNGGA)를 활용한 위치 인식
- Google Map API를 활용하여 웹 서버에 차량의 현재 위치 표현
- 프로젝트 설명 및 동영상을 위한 웹서버 구축
- Lane Detection 기능 일부분 담당

## 5. 시연영상
- [GPS 주행 테스트](https://youtu.be/mS-XMv0DXyI)
- [실내 진입금지후 STOP 표지판 테스트1](https://youtu.be/ezSZCGsHeOE)
- [실내 진입금지후 STOP 표지판 테스트2](https://youtu.be/VZLbV189xVc)
- [실내 사람(이미지) 인식 테스트](https://youtu.be/fWBu_FuCiHA)
- [실외 트랙 주행 테스트](https://youtu.be/rxKsBFIYjmE)
## 6. 회고
### 문제점 및 개선방안
>  초기에는 차량 주행을 실내가 아닌 실외에서 진행했는데 외부환경에 대한 영향이 크게 작용했다. 카메라를 통해 차선 인식·사물인식을 진행하다 보니 일조량에 따라 차선인식이 정상적으로 동작하지 않아 차량이 트랙을 주행 중 경로 이탈하는 경우가 발생하였고 사물인식 또한 일조량에 따라 정확도의 차이가 발생하였다. 경로 이탈의 주요 원인은 차선인식을 명암대비로 진행하게 되는데 일조량이 많을 경우 바닥면에서 빛이 반사되어 차선보다 주변이 명도가 높게 측정이 되는 것이 원인이다.</br>
   외부 환경에 따라 카메라의 설정을 변경하여 연구 목표 1단계를 완료하고 표지판 및 사람을 인식하여 진행하는 부분은 실내에서 진행하였다. 카메라 설정을 HSV를 통해 외부환경에 맞춰주고 일정 기울기 이상의 직선은 인식되지 않게 Lane detection 소스코드를 수동적으로 변경하였다. 매번 실외에서 설정을 수동적으로 변경하지 않고 기상청의 데이터를 수집하거나 조도센서 등을 이용하여 날씨나 빛의 세기에 따라 미리 설정 값을 지정하면 개선이 가능할 것으로 예상된다. 사물인식 역시 이와 같은 방법으로 개선이 가능할 것이다.</br>
   추후에 프로젝트를 계속해서 진행한다면 레이더·라이더를 추가하여 장애물을 회피하는 기능과 현재는 GPS를 통해 현재 위치만 웹서버 상에 표시되지만 차량의 이동거리를 추가하고 목적지를 입력하면 차량이 목적지까지 자율 주행하는 기능을 추가하고 싶다. 그리고 프로젝트에서는 하나의 차선에서 차량 한 대로 진행했는데 차선과 차량을 추가해서 추월하는 기능이나 차선 변경하는 기능을 추가해서 진행해보고 싶다.
