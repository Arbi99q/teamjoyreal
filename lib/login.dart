import 'package:flutter/material.dart';
import 'package:teamjoyreal/pwfind.dart';
import 'package:teamjoyreal/pwphone.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로그인 페이지'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/캐릭터3.webp',
              width: 300,
              height: 300,
            ),
            // 로그인 폼 위젯
            LoginForm(
              usernameController: _usernameController,
              passwordController: _passwordController,
              onLoginPressed: _handleLogin,
              isLoading: _isLoading,
            ),
          ],
        ),
      ),
      )
    );
  }

  void startLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  void stopLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  void _handleLogin(String username, String password) {
    // 여기에 실제 로그인 처리 코드를 추가
    // 아이디와 비밀번호가 하드코딩된 값과 일치하는지 확인
    if (username == 'yourUsername' && password == 'yourPassword') {
      print('Login successful!');

      // 로그인이 성공했다고 가정하고 새로운 페이지로 이동
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoggedInPage(),
        ),
      );
    } else {
      print('Login failed!');

      // Get a reference to the current scaffold for showing the dialog
      final scaffoldContext = ScaffoldMessenger.of(context);

      // Show a SnackBar instead of an AlertDialog for a better user experience
      scaffoldContext.showSnackBar(
        const SnackBar(
          content: Text('로그인 실패: 아이디나 비밀번호가 맞지 않습니다.'),
          duration: Duration(seconds: 3),
        ),
      );
    }

    // 비동기 작업 완료 후 로딩 상태 갱신
    stopLoading();
  }
}

class LoggedInPage extends StatelessWidget {
  const LoggedInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로그인 완료'),
      ),
      body: const Center(
        child: Text('로그인이 완료되었습니다!'),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final Function(String, String) onLoginPressed;
  final bool isLoading;

  const LoginForm({
    Key? key,
    required this.usernameController,
    required this.passwordController,
    required this.onLoginPressed,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        children: [
          const SizedBox(height: 50),

          const Text(
            '로그인을 진행해주세요',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),

          // 아이디 입력 필드
          TextFormField(
            controller: usernameController,
            decoration: InputDecoration(
              labelText: '아이디',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 234, 126, 118),
                  width: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // 비밀번호 입력 필드
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: '비밀번호',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 234, 126, 118),
                  width: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // 로그인 버튼
          ElevatedButton(
            onPressed: isLoading
                ? null
                : () {
                    onLoginPressed(
                      usernameController.text,
                      passwordController.text,
                    );
                  },
            child: const Text('로그인'),
          ),

          // '혹시 아이디나 비밀번호를 까먹으셨나요?' 버튼
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FindPage()),
              );
              // 아이디나 비밀번호를 까먹었을 때 수행해야 할 동작 추가
            },
            child: const Text('혹시 아이디나 비밀번호를 까먹으셨나요?'),
          ),

          // 이미지
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

class FindPage extends StatelessWidget {
  const FindPage({Key? key}) : super(key: key);

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
            child: Text('찾고 싶은 정보를 선택해주세요',
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
                    MaterialPageRoute(builder: (context) => const IDfindpage()),
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
                  '아이디',
                  style: TextStyle(
                    fontFamily: "abcd",
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PhonePage()),
                  );
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
                child: const Text('비밀번호',
                    style: TextStyle(
                      fontFamily: "abcd",
                      fontSize: 20,
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

class IDfindpage extends StatelessWidget {
  const IDfindpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '로그인',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/너구리.webp',
              width: 300, // 이미지 크기 조절 가능
              height: 300,
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                hintText: '이름을 입력하세요',
                labelText: '이름을 입력하세요',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                hintText: '학번을 입력하세요',
                labelText: '학번을 입력하세요',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const IDconfirmpage()),
                );
              },
              child: const Text('다음으로'),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/로고.png',
              width: 100, // 로고 이미지 크기 조절 가능
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

class IDconfirmpage extends StatelessWidget {
  const IDconfirmpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '아이디',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/너구리.webp',
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 20),
              const Text(
                "아이디는 '나는 한국인' 입니다", // 여기에 실제 아이디 정보를 표시하도록 수정
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(), // 이 부분 수정
                    ),
                  );
                },
                child: const Text('로그인창으로 이동'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // 비밀번호 찾기 동작 추가
                  // 예를 들어, Navigator.push를 사용하여 비밀번호 찾기 화면으로 이동할 수 있습니다.
                },
                child: const Text('비밀번호 찾기'),
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
      ),
    );
  }
}
