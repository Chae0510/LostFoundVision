import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fortest/main.dart';
import 'package:image_picker/image_picker.dart';
import 'imageDisplay.dart';

//////////챗지피티///////////////
import 'dart:convert';
import 'package:http/http.dart' as http;
///////////////////////////////

void main() {
  runApp(const MaterialApp(
    home: AddGoodsScreen(),
  ));
}


class AddGoodsScreen extends StatefulWidget {
  const AddGoodsScreen({super.key});

  @override
  _AddGoodsScreenState createState() => _AddGoodsScreenState();
}

class _AddGoodsScreenState extends State<AddGoodsScreen>{
  XFile? _image;

  ////챗지피티 특징 서술/////
  String _description = "Upload an image to get description";


  @override
  void initState() {
    super.initState();
  }

  Future<void> _pickIMGFile(ImageSource source) async {
    final picker = ImagePicker();
    XFile? image = await picker.pickImage(source: source);

    if (image != null) {

      /////////// 이미지 선택 후 설명 가져오기
      await _getDescription(File(image.path));


      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ImageDisplayScreen(imagePath: image.path,
            description: _description)),
      );
    }
  }

  ////////////////
  Future<void> _getDescription(File image) async {
    final bytes = await image.readAsBytes();
    final base64Image = base64Encode(bytes);

    final requestPayload = jsonEncode({

      'model': 'gpt-4-1106-vision-preview',
      'messages': [
        {
          'role': 'system',
          'content': 'You are a helpful assistant that provides a one-line description of images.'
        },
        {
          'role': 'user',
          'content': 'Describe this object in korean. (Ex. color, type, appearance). This is the image: https://firebasestorage.googleapis.com/v0/b/lostfoundvision-bb117.appspot.com/o/userProfileImages%2Fpinktumbler.jpeg?alt=media&token=819c9543-cec4-4412-90a9-93bfd7c1b923'
              'If you cannot do it, please tell me the reason as detail. Also can you tell me the specific way to fix the problem?'
        }
      ],
      'max_tokens': 200,
    });


    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'), // // 엔드포인트
      headers: {
        'Authorization': 'api key', // OpenAI API 키
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: requestPayload,
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      //final responseData = jsonDecode(response.body);
      final responseData = jsonDecode(utf8.decode(response.bodyBytes));

      setState(() {
        _description = responseData['choices'][0]['message']['content'];
      });
    } else {
      print('Error: ${response.body}');
      setState(() {
        _description = 'Failed to get description';
      });
    }

  }
  //////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('분실물 등록',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,)
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: (){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const MyAppPage()),
                    (Route<dynamic> route) => false,
              );
            },
          )
        ],
      ),

      body: Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? const Text('업로드할 방식을 선택하세요',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600,))
                : Image.file(
              File(_image!.path),
              width: 400,
              height: 400,
            ),

            const SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    _pickIMGFile(ImageSource.gallery);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 130, 155, 255), // 갤러리 버튼 색상
                    onPrimary: Colors.white, // 갤러리 텍스트 색상
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), // 버튼 모서리를 조절
                    ),
                    minimumSize: const Size(160, 180),
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.photo, size: 120), // 갤러리 아이콘
                      const SizedBox(height: 3), // 간격 조절
                      const Text('갤러리에서 선택',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,)),
                    ],
                  ),
                ),

                const SizedBox(width: 10), // 간격 조절

                ElevatedButton(
                  onPressed: () {
                    _pickIMGFile(ImageSource.camera);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(230, 170, 173, 173), // 카메라 버튼 색상
                    onPrimary: Colors.white, // 카메라 텍스트 색상
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), // 버튼 모서리를 조절
                    ),
                    minimumSize: const Size(170, 180),
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.camera_alt, size: 110), // 카메라 아이콘
                      const SizedBox(height: 3), // 간격 조절
                      const Text('카메라로 촬영',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,)),
                    ],
                  ),
                ),
              ],
            ),


          ],
        ),
      ),


    );
  }


}
