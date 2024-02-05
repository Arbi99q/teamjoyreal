import 'package:flutter/material.dart';
import 'package:teamjoyreal/phone.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Handong Forest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegPage(),
    );
  }
}

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool isLoggedIn = false;

  // Function to check for duplicate username (replace with actual logic)
  bool isUsernameUnique(String username) {
    // Replace this logic with your actual check for duplicate usernames
    // For now, assume the username is unique
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '아래의 내용을\n기입해주세요.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                const Icon(Icons.battery_std, color: Colors.white),
                const SizedBox(width: 8.0),
                Text(
                  '${DateTime.now().hour}:${DateTime.now().minute}',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250.7,
              width: 130.7,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/hguforest_1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 아이디 입력 폼 필드와 중복 확인 버튼을 포함한 Row
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            labelText: '아이디',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      TextButton(
                        onPressed: () {
                          // Check for duplicate username
                          bool isUnique = isUsernameUnique(_usernameController.text);
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('중복 확인'),
                                content: Text(
                                  isUnique
                                      ? '중복된 아이디가 없습니다.'
                                      : '중복된 아이디가 있습니다.',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('확인'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text('중복 확인'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  // 비밀번호 입력 폼 필드
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: '비밀번호',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  // 비밀번호 확인 입력 폼 필드
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: '비밀번호 확인',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: isUsernameUnique(_usernameController.text)
                        ? () {
                      // 비밀번호와 비밀번호 확인이 일치하는지 여부 확인
                      if (_passwordController.text == _confirmPasswordController.text) {
                        setState(() {
                          isLoggedIn = true;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PhonePage(),
                          ),
                        );
                      } else {
                        // 비밀번호와 비밀번호 확인이 일치하지 않을 때의 처리
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('비밀번호 확인 오류'),
                              content: const Text('비밀번호와 비밀번호 확인이 일치하지 않습니다.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('확인'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }
                        : null, // 사용자 이름이 고유하지 않으면 onPressed를 null로 설정
                    child: const Text('다음으로'),
                  ),
                  const SizedBox(height: 16.0),
                  // 로고 이미지
                  Image.asset(
                    'assets/images/hguforest_logo.png', // 로고 이미지 파일의 경로
                    height: 80.0, // 로고 이미지의 높이 조절
                  ),
                  const SizedBox(height: 24.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
