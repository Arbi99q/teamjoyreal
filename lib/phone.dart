import 'package:flutter/material.dart';
import 'package:teamjoyreal/phoneCheck.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Handong Forest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PhonePage(),
    );
  }
}

class PhonePage extends StatefulWidget {
  const PhonePage({Key? key}) : super(key: key);

  @override
  _PhonePageState createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _verificationCodeController =
      TextEditingController();
  bool isVerificationCodeSent = false;

  void sendVerificationCode() {
    // TODO: Add logic to send verification code
    // You can replace the print statement with the actual code to send the verification code
    print('Verification code sent!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '핸드폰 번호를\n 인증해주세요.',
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
                  // Phone number input field with number keyboard
                  const SizedBox(height: 50.0),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: '휴대폰 번호를 입력하세요.',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 16.0),

                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      sendVerificationCode();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhoneCheckPage(
                              phoneNumber: _phoneController.text),
                        ),
                      );
                      setState(() {
                        isVerificationCodeSent = true;
                      });
                    },
                    child: const Text('인증번호 받기'),
                  ),

                  const SizedBox(height: 120.0), // 조정된 여백 크기
                  // Logo image
                  Image.asset(
                    'assets/images/hguforest_logo.png',
                    height: 80.0,
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
