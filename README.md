# GraduationProject - Lost&Found Vision
This project is our graduation project.

# Brief Explanation of this project (Eng)
This is an application that **allows you to register and find lost items** .
The purpose of this project is **to make it easier and more convenient to find and register lost items by utilizing computer vision** .
It provides convenience to users by allowing the model **to recognize and analyze the photo of the lost object** to be registered to **capture the features of the photo and automatically write the features** instead of the author.
We hope this project will help society even a little.

----------------------------------------------------

# Description about files (Explanation of codes)
## main.dart
<img src="https://github.com/berry1015/fortest/assets/79952916/f6a041a6-06a4-45cf-b896-d61ee966d621" alt="mainscreen" width="200" height="400"></br>
It's literally a **main screen and a home screen**. We've got **buttons and a bottom navigation bar** to move to various screens.

## addGoods Folder
It is a folder with files that allow you to **register lost items and check what you wrote**.

### addGoods.dart
<img src="https://github.com/berry1015/fortest/assets/79952916/4a84621a-41ba-4d5e-9ec7-01f4168c02b7" alt="addGoods" width="200" height="400"></br>
This is a screen where you can choose **whether to upload a photo from the gallery or take a picture with a camera**.

### imageDisplay.dart
<img src="https://github.com/berry1015/fortest/assets/79952916/1be5a5ac-54a6-49ad-b987-b379059266e0" alt="ImageDisplay" width="200" height="400"></br>
It is a file that allows you to **put uploaded photos into the openAI model to extract features** and create them.

### imsi_gul.dart
<img src="https://github.com/berry1015/fortest/assets/79952916/a0f1a548-fcf6-482b-8e32-b387ebdb9723" alt="imsi_gul" width="200" height="400"></br>
It's a file that displays **all the previous writings as a list of big cards**.

### seeMyGul - seeMyGul.dart
<img src="https://github.com/berry1015/fortest/assets/79952916/5694906a-77f9-483b-b191-050e144edf30" alt="seeMyGul" width="200" height="400"></br>
It's a file that allows you to **see my writings at a glance with a small list of cards**.

### seeMyGul- GulDetailScreen.dart
<img src="https://github.com/berry1015/fortest/assets/79952916/8a19114b-624b-4cae-9363-a8ac3749a9c4" alt="GulDetailScreen" width="200" height="400"></br>
This is a screen that shows the **details of each post**.



## findGoods Folder
It's a screen where you can **find lost items**.

### findGoods.dart
<img src="https://github.com/berry1015/fortest/assets/79952916/15c8bb06-046e-478a-aa19-843587510cbc" alt="findGoods" width="200" height="400"></br>
A file that **displays a map of the Republic of Korea and markers for each administrative district of Seoul** on the screen **using Naver Map api**. Tap a **specific marker to go to the lost and found list of the administrative district**.

### next_screen.dart
<img src="https://github.com/berry1015/fortest/assets/79952916/1c7e9e0e-98d0-4ba1-b19a-8b58b7aa4085" alt="next_screen" width="200" height="400"></br>
This is a next screen of **when you tap the marker in findGoods.dart**. It shows the **lost and found list of the administrative district**.

### seeGuDetail.dart
It's a screen that **contains the details of the post**. (It is same as "GulDetailScreen")


## firebase Folder
It's literally a **folder related to firebase**.
### firebase_options.dart
File with options for communicating with firebase.
### gulItem.dart
It's a file that **matches the variables in the flutter with the variables in the firebase**.


## mainScreen Folder
It's a folder with **files on the home screen**.

### alarm.dart

A file that **displays a notification for the keyword**. (it is still incomplete and needs to be made later)

### goodsList.dart
<img src="https://github.com/berry1015/fortest/assets/79952916/f82993f3-4564-4a53-b58a-9e48001f3e27" alt="goodsList" width="200" height="400"></br>
The file corresponds to the **'List of Lost and Found in My Village' tab**.

### keywords.dart

It's a screen where you can **add a keyword to be notified**. (it is still incomplete and needs to be made later)

### search.dart
<img src="https://github.com/berry1015/fortest/assets/79952916/b373017f-5ea1-484c-a68e-82efb14e058e" alt="search" width="200" height="400"></br>
This is a screen where you can **search for the lost item you want to find**.
You can search for **major, minor, sub-categories, and features**.

### village.dart
<img src="https://github.com/berry1015/fortest/assets/79952916/69e98614-0cf7-43b3-8edd-1db850e73540" alt="village" width="200" height="400"></br>
This is a screen where you can **set up your village**.


## personalInfo Folder
It's literally a folder with **files related to personal information**.

### findPassword.dart

It's literally a **password finding file**. (It's still incomplete.)

### join.dart
<img src="https://github.com/berry1015/fortest/assets/79952916/1d126ae2-dd99-4e6a-a64e-5e2a91f598f6" alt="join" width="200" height="400"></br>
It's **a membership join screen**.

### personalInfo.dart
<img src="https://github.com/berry1015/fortest/assets/79952916/15e71697-e2b5-4d69-9ae9-cab57e037376" alt="personalInfo" width="200" height="400"></br>
It's a file that can be **moved to the screen related to personal information**.

### withdrawal.dart
<img src="https://github.com/berry1015/fortest/assets/79952916/357219b5-1f86-44d7-b6f7-cc4d939a40a4" alt="withdrawal" width="200" height="400"></br>
Literally a file where **membership can be withdrawn**.

### login Folder
It's a folder **containing files related to login**.
### login Folder - login.dart
<img src="https://github.com/berry1015/fortest/assets/79952916/e2fbf911-09c0-46de-a60f-11a8fb846ced" alt="login" width="200" height="400"></br>
It's a file that **you can log in to**.

### login Folder - loginSuccess.dart
<img src="https://github.com/berry1015/fortest/assets/79952916/8335bdaa-8d05-4053-be4a-d538f0995d2c" alt="loginSuccess" width="200" height="400"></br>
This is a screen that shows **successful login, where you can set up your profile picture**.

### login Folder - changeProfile Folder - changePassword.dart
<img src="https://github.com/berry1015/fortest/assets/79952916/6f1f78cd-cdec-4bdd-a4a9-0ddb95ecbbb5" alt="changePassword" width="200" height="400"></br>
This screen is used to **change the password**.

### login Folder - changeProfile Folder - changeProfile.dart
<img src="https://github.com/berry1015/fortest/assets/79952916/c1aa14eb-5173-4402-8ec3-181e94c72aec" alt="changeProfile" width="200" height="400"></br>
This file is used when you **want to change your profile**. You can change **your profile picture, change your password, and set up your village**.

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


