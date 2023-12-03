import 'package:flutter/material.dart';
import 'package:fortest/alarmTap.dart';
import 'package:fortest/main.dart';
import 'package:fortest/searchTap.dart';
import 'package:fortest/listAccessory.dart';
import 'package:fortest/listElectronics.dart';
import 'package:fortest/listEtc.dart';

void goToAnotherPage(BuildContext context, String pageName) {
  // 버튼에 따라 그에 해당하는 파일로 이동
  switch (pageName) {
    case "CategoryTap":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CategoryTapScreen()),
      );
      break;


    case "SearchTap":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SearchTapScreen()),
      );
      break;


    case "AlarmTap":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AlarmTapScreen()),
      );
      break;

    case "ElectronicTap":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ListElectronics()),
      );
      break;

    case "AccessoryTap":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ListAccessory()),
      );
      break;

    case "EtcTap":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ListEtc()),
      );
      break;
  }
}


void main() {
  runApp(const MaterialApp(
    home: CategoryTapScreen(),
  ));
}


class CategoryTapScreen extends StatefulWidget {
  const CategoryTapScreen({super.key});

  @override
  _CategoryTapScreenState createState() => _CategoryTapScreenState();
}


class _CategoryTapScreenState extends State<CategoryTapScreen> {
  int _currentIndex = 0; // 현재 활성화된 탭 인덱스


  // 각 탭에 해당하는 제목
  final List<String> _tabTitles = ["카테고리", "검색", "알림"];


  void _onTabTapped(int index) {
    String pageName;


    switch (index) {
      case 0:
        pageName = "CategoryTab";
        break;
      case 1:
        pageName = "SearchTab";
        break;
      case 2:
        pageName = "AlarmTab";
        break;
      default:
        pageName = "CategoryTab"; // Set a default page if needed
    }
    goToAnotherPage(context, pageName);


    setState(() {
      _currentIndex = index; // 탭 변경 시 _currentIndex 업데이트
    });
  }


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    Widget currentScreen;
    switch (_currentIndex) {
      case 0:
        currentScreen = Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              ElevatedButton(
                onPressed: () {
                  goToAnotherPage(context, "ElectronicTap");
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 130, 155, 255),
                    ),
                  minimumSize:
                  MaterialStateProperty.all(Size(screenWidth*0.7, screenHeight*0.23)),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.fromLTRB(15, 0, 10, 0),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // Make the button rectangular
                    ),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.phone_android,size:100),
                    SizedBox(width: 16.0),
                    Text('전자기기\nElectronics',
                        style: TextStyle(fontSize: 35)),
                  ],
                ),
              ),


              ElevatedButton(
                onPressed: () {
                  goToAnotherPage(context, "AccessoryTap");
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 130, 155, 255),
                    ),
                  minimumSize:
                  MaterialStateProperty.all(Size(screenWidth*0.4, screenHeight*0.23)),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.fromLTRB(15, 0, 10, 0),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // Make the button rectangular
                    ),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.redeem,size:100),
                    SizedBox(width: 16.0),
                    Text('악세사리\nAccessories',
                        style: TextStyle(fontSize: 35)),
                  ],
                ),
              ),


              ElevatedButton(
                onPressed: () {
                  goToAnotherPage(context, "EtcTap");
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 130, 155, 255),
                    ),
                  minimumSize:
                  MaterialStateProperty.all(Size(screenWidth*0.4, screenHeight*0.23)),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.fromLTRB(15, 0, 10, 0),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // Make the button rectangular
                    ),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.star_outline,size:100),
                    SizedBox(width: 20.0),
                    Text('기타\nAnything Else',
                        style: TextStyle(fontSize: 35)),
                  ],
                ),
              ),
            ],
          ),
        ); //// 카테고리 탭 화면
        break;
      case 1:
        currentScreen = const Center(
          child: Text('검색', style: TextStyle(fontSize: 24)),
        ); // 검색 탭 화면
        break;
      case 2:
        currentScreen = const Center(
          child: Text('알림', style: TextStyle(fontSize: 24)),
        ); // 알림 탭 화면
        break;
      default:
        currentScreen = Container(); // 예외 처리 - 이 부분을 다른 화면으로 대체하거나 적절히 처리
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(_tabTitles[_currentIndex],
            style: TextStyle(fontSize: 25,
              fontFamily: 'HakgyoansimDoldam',
              fontWeight: FontWeight.w700,)
          ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (Route<dynamic> route) => false,
              );
            },
          )
        ],
      ),


      body: currentScreen, // 현재 선택된 탭에 대한 화면 표시


      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 버튼 크기 고정
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.list),
            label: "카테고리",
            backgroundColor: _currentIndex == 0 ? Colors.blue : null,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: "검색",
            backgroundColor: _currentIndex == 1 ? Colors.blue : null,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications),
            label: "알림",
            backgroundColor: _currentIndex == 2 ? Colors.blue : null,
          ),
        ],
      ),
    );
  }
}
