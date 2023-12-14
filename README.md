# GraduationPrject
## Lost&Found Vision

'Lost&Found Vision' 프로젝트는 커뮤니티 기반 분실물 인식 및 공유 애플리케이션입니다. 이 애플리케이션은 위치 기반 서비스와 이미지 처리 기술을 활용하여 분실물을 자동으로 인식하고 분류하여 커뮤니티와 공유함으로써 분실물을 찾아주는 서비스를 제공합니다.

### 주요 기능

#### 1. 물건 업로드

- 사용자는 애플리케이션을 통해 분실한 물건을 업로드할 수 있습니다.
- 업로드된 이미지는 이미지 처리를 통해 물건을 자동으로 인식하고 분류됩니다.
- 분류된 정보는 데이터베이스에 저장되고 지도에 해당 물건의 위치가 표시됩니다.

#### 2. 물건 검색

- 사용자는 키워드 또는 분류된 물건의 카테고리를 기반으로 물건을 검색할 수 있습니다.
- 검색 결과는 지도 또는 목록 형식으로 표시됩니다.

#### 3. 알림 설정

- 사용자는 특정 키워드에 대한 알림을 설정할 수 있습니다.
- 알림 설정된 키워드와 관련된 물건이 업로드되면 사용자에게 알림이 전송됩니다.

### 사용법

1. **물건 업로드**:
   - 애플리케이션을 실행하고 "물건 업로드" 기능을 선택합니다.
   - 업로드할 물건의 이미지와 정보를 제공합니다.
   - 업로드 버튼을 클릭하여 물건을 업로드합니다.

2. **물건 검색**:
   - "물건 검색" 기능을 사용하여 키워드 또는 카테고리로 물건을 검색합니다.
   - 검색 결과를 확인하고 관심 있는 물건을 찾습니다.

3. **알림 설정**:
   - "알림 설정" 메뉴에서 원하는 키워드에 대한 알림을 설정합니다.
   - 설정한 키워드와 관련된 물건이 업로드되면 알림을 받습니다.

## Database
<img width="552" alt="image" src="https://github.com/berry1015/fortest">

## Map
Naver Cloud Platform에서 Naver Map API 권한을 받아와 사용하였습니다.

![naver api](https://github.com/berry1015/fortest/assets/120501910/621f2bca-9916-4317-884d-ad58a7bb0c81)

앱 내 지도 실행 화면

![map](https://github.com/berry1015/fortest/assets/120501910/cf56bd7d-ee11-4670-bae6-52c9b41430e1)

## 기술 스택
- 프론트엔드: Flutter
- 데이터베이스: Firebase
- 이미지 처리: OpenCV
- 지도 서비스: Naver API

---------------------------------------------------
# Brief Explanation of this project (Eng)

This is an application that allows you to register and find lost items.
The purpose of this project is to make it easier and more convenient to find and register lost objects by utilizing computer vision.
It provides convenience to users by allowing the model to recognize and analyze the photo of the lost object to be registered to capture the features of the photo and automatically write the features instead of the author.
We hope this project will help society even a little.

# Description about files
## main.dart
It's literally a main screen and a home screen. We've got buttons and a bottom navigation bar to move to various screens.

----------------------------------------------------
## addGoods Folder
It is a folder with files that allow you to register lost items and check what you wrote.
### addGoods.dart
This is a screen where you can choose whether to upload a photo from the gallery or take a picture with a camera.
### imageDisplay.dart
It is a file that allows you to put uploaded photos into the model to extract features and create them.
### imsi_gul.dart
It's a file that displays all the previous writings as a list of big cards.
### seeMyGul - seeMyGul.dart
It's a file that allows you to see my writings at a glance with a small list of cards
### seeMyGul- GulDetailScreen.dart
This is a screen that shows the details of each post

----------------------------------------------------
## findGoods Folder
It's a screen where you can find lost items
### findGoodsdart
A file that displays a map of the Republic of Korea and markers for each administrative district of Seoul on the screen using Naver Map api. Tap a specific marker to go to the lost and found list of the administrative district.
### next_screen.dart
This is a screen that falls when you tap the marker in findGoods.dart. It shows the lost and found list of the administrative district.
### seeGuDetail.dart
It's a screen that contains the details of the post

----------------------------------------------------
## firebase Folder
It's literally a folder related to firebase
### firebase_options.dart
File with options for communicating with firebase
### gulItem.dart
It's a file that matches the variables in the flutter with the variables in the firebase

----------------------------------------------------
## mainScreen Folder
It's a folder with files on the home screen
### alarm.dart
A file that displays a notification for the keyword (it is still incomplete and needs to be made later)
### goodsList.dart
The file corresponds to the 'List of Lost and Found in My Village' tab.
### keywords.dart
It's a screen where you can add a keyword to be notified
### search.dart
This is a screen where you can search for the lost item you want to find.
You can search for major, minor, sub-categories, and features
### village.dart
This is a screen where you can set up your village.

----------------------------------------------------
## personalInfo Folder
It's literally a folder with files related to personal information
### findPassword.dart
It's literally a password finding file. (It's still incomplete.)
### join.dart
It's literally, a membership join screen
### personalInfo.dart
It's a file that can be moved to the screen related to personal information
### withdrawal.dart
Literally! a file where membership can be withdrawn
### login Folder
It's literally a folder containing files related to login
### login Folder - login.dart
Literally! It's a file that you can log in to
### login Folder - loginSuccess.dart
This is a screen that shows successful login, where you can set up your profile picture.
### login Folder - changeProfile Folder - changePassword.dart
This screen is used to change the password
### login Folder - changeProfile Folder - changeProfile.dart
This file is used when you want to change your profile. You can change your profile picture, change your password, and set up your village

----------------------------------------------------
### imsi_join.dart is just a test file if the infomation that I signed up for is going well.

----------------------------------------------------
## Badges that We used in this project

![js](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![js](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![js](https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=white)
![js](https://img.shields.io/badge/Powershell-2CA5E0?style=for-the-badge&logo=powershell&logoColor=white)
![js](https://img.shields.io/badge/GIT-E44C30?style=for-the-badge&logo=git&logoColor=white)
![js](https://img.shields.io/badge/Google_Cloud-4285F4?style=for-the-badge&logo=google-cloud&logoColor=white)
![js](https://img.shields.io/badge/Google-4285F4?logo=google&logoColor=fff&style=for-the-badge)
![js](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)
![js](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)
![js](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)


