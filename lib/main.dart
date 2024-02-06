import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:teamjoyreal/Register.dart';
import 'dart:typed_data';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();

    // 2초 후에 페이지 전환
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SecondPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = 3.0;
            const end = 3.0;
            const curve = Curves.easeInOut;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            var fadeAnimation = animation.drive(tween);

            return FadeTransition(
              opacity: fadeAnimation,
              child: child,
            );
          },
          transitionDuration: const Duration(seconds: 2),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/동물의 숲.jpeg',
            width: 900,
            height: 1000,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 8),
                const Text(
                  '한동의 숲',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 8, 8, 8),
                    fontSize: 80,
                    fontWeight: FontWeight.w200,
                    fontFamily: "abcd",
                  ),
                ),
                const SizedBox(height: 8),
                Image.asset(
                  'assets/images/한동대.png',
                  width: 130,
                  height: 130,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    super.initState();

    // 2초 후에 페이지 전환
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const ThirdPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = .0;
            const end = 1.0;
            const curve = Curves.easeInOut;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            var fadeAnimation = animation.drive(tween);

            return FadeTransition(
              opacity: fadeAnimation,
              child: child,
            );
          },
          transitionDuration: const Duration(seconds: 3),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/동물의 숲.jpeg',
            width: 900,
            height: 1000,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 8),
                const SizedBox(height: 8),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Image.asset(
                    'assets/images/한동대.png',
                    width: 200,
                    height: 200,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FirstVisitPage extends StatelessWidget {
  const FirstVisitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('한동의 숲'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/너구리.webp',
            width: 600,
            height: 300,
          ),
          const Center(
            child: Text('한동인이 맞으신가요?',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: "abcd",
                )),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // '네' 버튼이 클릭되었을 때 실행될 코드 추가
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConfirmationPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 60,
                  ),
                  backgroundColor: const Color.fromARGB(255, 242, 197, 165),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: const Text(
                  ' 네 ',
                  style: TextStyle(
                    fontFamily: "abcd",
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  // '아니오' 버튼이 클릭되었을 때 실행될 코드 추가
                },
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 60,
                  ),
                  backgroundColor: const Color.fromARGB(255, 242, 197, 165),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: const Text('아니오',
                    style: TextStyle(
                      fontFamily: "abcd",
                      fontSize: 18,
                      color: Colors.black,
                    )),
              ),
            ],
          ),
          Image.asset(
            'assets/images/로고.png',
            width: 100, // 이미지 크기 조절
            height: 100,
          ),
        ],
      ),
    );
  }
}

// import your login.dart file

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/한동의 숲.png',
              width: 400,
              height: 400,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FirstVisitPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 5,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                backgroundColor: const Color.fromARGB(255, 239, 255, 241),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: const Text(
                '   첫 방문이신가요?   ',
                style: TextStyle(
                  fontFamily: "abcd",
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 234, 126, 118),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 두 번째 버튼이 클릭되었을 때 login.dart로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const LoginPage()), // Replace LoginPage() with your actual class name
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 5,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                backgroundColor: const Color.fromARGB(255, 239, 255, 241),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: const Text(
                '이전에 방문하셨나요?',
                style: TextStyle(
                  fontFamily: "abcd",
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 234, 126, 118),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/로고.png',
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({Key? key}) : super(key: key);

  void main() {
    runApp(const MaterialApp(home: ConfirmationPage()));
  }

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

// 추가

class _ConfirmationPageState extends State<ConfirmationPage> {
  Uint8List? selectedImageBytes;

  @override
  Widget build(BuildContext context) {
    Future<void> getImageFromGallery() async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        final List<int> imageBytes = await pickedFile.readAsBytes();
        setState(() {
          selectedImageBytes = Uint8List.fromList(imageBytes);
        });

        // 이미지 선택 후 2초 뒤에 다음 페이지로 이동
        Timer(const Duration(seconds: 2), () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NextPage(), // 다음 페이지의 위젯
            ),
          );
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('확인 페이지'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/너구리2.webp',
            width: 300,
            height: 300,
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              '인증해주세요!',
              style: TextStyle(
                fontSize: 30,
                fontFamily: "abcd",
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              getImageFromGallery();
            },
            style: ElevatedButton.styleFrom(
              elevation: 5,
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 60,
              ),
              backgroundColor: const Color.fromARGB(255, 242, 197, 165),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '증명서 첨부',
                  style: TextStyle(
                    fontFamily: "abcd",
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                if (selectedImageBytes != null)
                  Image.memory(
                    selectedImageBytes!,
                    width: 100,
                    height: 100,
                  ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/로고.png',
            width: 100,
            height: 100,
          ),
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Function to navigate to the next page after a delay
    void navigateToNextPage() {
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NextStepPage()),
        );
      });
    }

    // Call the function when the page is built
    navigateToNextPage();

    return Scaffold(
      appBar: AppBar(
        title: const Text('확인 페이지'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/캐릭터.png',
              width: 400,
              height: 400,
            ),
          ),
          const SizedBox(height: 20),
          const Column(
            children: [
              Text(
                '증명서를 확인중이에요...',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "abcd",
                ),
              ),
              Text(
                '잠시만 기다려주세요',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "abcd",
                ),
              ),
            ],
          ),
          Image.asset(
            'assets/images/로고.png',
            width: 100, // 이미지 크기 조절
            height: 100,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class NextStepPage extends StatelessWidget {
  const NextStepPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('다음 단계 페이지'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/너구리.webp',
              width: 400,
              height: 400,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            '인증이 완료되었어요!',
            style: TextStyle(
              fontSize: 25,
              fontFamily: "abcd",
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegPage()),
              );
              // Add navigation logic for the next step if needed
            },
            style: ElevatedButton.styleFrom(
              elevation: 5,
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 60,
              ),
            ),
            child: const Text('다음 단계'),
          ),
          Image.asset(
            'assets/images/로고.png',
            width: 100, // 이미지 크기 조절
            height: 100,
          ),
        ],
      ),
    );
  }
}
