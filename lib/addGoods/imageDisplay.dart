import 'package:flutter/services.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fortest/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'imsi_gul.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

void main() {
  runApp(const MaterialApp(
    home: ImageDisplayScreen(
      imagePath: '', description: '',
    ),
  ));
}

class ImageDisplayScreen extends StatefulWidget {
  final String imagePath;
  final String description;

  const ImageDisplayScreen({
    required this.imagePath,
    required this.description,
  });

  @override
  _ImageDisplayScreenState createState() => _ImageDisplayScreenState();
}

class UserData {
  String name;
  String email;
  String nickname;
  String? profileImgUrl;

  UserData({
    required this.name,
    required this.email,
    required this.nickname,
    required this.profileImgUrl,
  });
}

class _ImageDisplayScreenState extends State<ImageDisplayScreen> {
  UserData userData = UserData(
    name: '',
    email: '',
    nickname: '',
    profileImgUrl: '',
  );
  String item = '';
  String selectedCategory = '전자기기'; // To store the selected category value
  List<String> categories = ['전자기기', '악세사리', '기타'];
  late String description; // 상태 변수로 정의

  @override
  void initState() {
    super.initState();
    description = widget.description; // 초기화
    loadUserData();
  }

  Future<void> loadUserData() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    print(currentUser);
    if (currentUser != null) {
      DocumentSnapshot userDataSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();
      print("Loaded user data: ${userDataSnapshot.data()}");
      setState(() {
        userData = UserData(
          name: userDataSnapshot['username'],
          email: currentUser.email ?? '',
          nickname: userDataSnapshot['nickname'],
          profileImgUrl: userDataSnapshot['profileImgUrl'],
        );
      });
    }
  }

  void uploadDataToFirestore() async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        await FirebaseFirestore.instance.collection('z').add({
          'user_id': currentUser.uid,
          'image_url': widget.imagePath,
          'item': item,
          'category': selectedCategory,
          'features': description,
        });
      }
    } catch (e) {
      print('Error uploading data to Firestore: $e');
    }
  }

  Future<Position> getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
        print('Error! 위치 권한이 거부되었습니다.');
      }
    }
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
    return position;
  }

  Future<String?> getAddress() async {
    var gps = await getLocation();
    double lat = gps.latitude;
    double lon = gps.longitude;
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    Placemark placemark = placemarks[0];

    if (placemarks.isNotEmpty) {
      String address = "${placemark.subLocality} ${placemark.thoroughfare}, ${placemark.locality}, ${placemark.administrativeArea}";
      print("변환된 주소: $address");
      return placemark.subLocality;
    } else {
      print("주소를 변환할 수 없습니다.");
      return "주소를 변환할 수 없습니다.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('글 작성',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            )),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const MyAppPage()),
                    (Route<dynamic> route) => false,
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.file(
              File(widget.imagePath),
              width: 400,
              height: 400,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  buildInputField('종류', item),
                  buildCategoryDropdown(), // Added the category dropdown
                  const SizedBox(height: 8),
                  // Text(
                  //   '특징: $description',
                  //   style: TextStyle(fontSize: 20),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0), // Add padding
                    child: TextFormField(
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                      decoration: InputDecoration(
                        labelText: '특징',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: null, // Allow unlimited lines
                      initialValue: description, // Set initial value
                      onChanged: (newValue) {
                        setState(() {
                          description = newValue;
                        });
                      },
                    ),
                  ),

                  SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        '현재 위치: ',
                        style: TextStyle(fontSize: 20),
                      ),
                      FutureBuilder(
                        builder: (context, snapshot) {
                          if (snapshot.hasData == false) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Error:$snapshot',
                                style: const TextStyle(fontSize: 15),
                              ),
                            );
                          } else {
                            String address = snapshot.data as String;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(address, style: const TextStyle(fontSize: 20)),
                                ],
                              ),
                            );
                          }
                        },
                        future: getAddress(),
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      uploadDataToFirestore();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImsiGulScreen(),
                        ),
                      );
                    },
                    child: Text('작성'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryDropdown() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text('대분류:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              )),
          SizedBox(width: 8),
          Expanded(
            child: DropdownButtonFormField<String>(
              value: selectedCategory,
              items: categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!;
                });
              },
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInputField(String label, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text('$label:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              )),
          SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
              ),
              onChanged: (newValue) {
                setState(() {
                  switch (label) {
                    case '종류':
                      item = newValue;
                      break;
                    case '특징':
                      description = newValue;
                      break;
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}