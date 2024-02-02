import 'package:flutter/material.dart';

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
      // 로그인 실패 시 알림 창 띄우기
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('로그인 실패'),
            content: const Text('아이디나 비밀번호가 맞지 않습니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // 창 닫기
                },
                child: const Text('확인'),
              ),
            ],
          );
        },
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
    return Column(
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
    );
  }
}
