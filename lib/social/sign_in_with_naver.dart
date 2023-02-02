import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';

class NaverSampleScreen extends StatefulWidget {
  const NaverSampleScreen({Key? key}) : super(key: key);

  @override
  State<NaverSampleScreen> createState() => _NaverSampleScreenState();
}

class _NaverSampleScreenState extends State<NaverSampleScreen> {
  LoginPlatform _loginPlatform = LoginPlatform.none;
  late NaverLoginResult result;

  void signInWithNaver() async {
    result = await FlutterNaverLogin.logIn();

    if (result.status == NaverLoginStatus.loggedIn) {
      print('accessToken = ${result.accessToken}');
      print('id = ${result.account.id}');
      print('email = ${result.account.email}');
      print('name = ${result.account.name}');

      setState(() {
        _loginPlatform = LoginPlatform.naver;
      });
    }
  }

  void signOut() async {
    switch (_loginPlatform) {
      case LoginPlatform.facebook:
        break;
      case LoginPlatform.google:
        break;
      case LoginPlatform.kakao:
        break;
      case LoginPlatform.naver:
        await FlutterNaverLogin.logOut();
        break;
      case LoginPlatform.apple:
        break;
      case LoginPlatform.none:
        break;
    }

    setState(() {
      _loginPlatform = LoginPlatform.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: _loginPlatform != LoginPlatform.none
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('이메일 : ${result.account.email}'),
                    const SizedBox(height: 20,),
                    Text('이름 : ${result.account.name}'),
                    const SizedBox(height: 20,),
                    _logoutButton(),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _loginButton(
                      'naver_logo',
                      signInWithNaver,
                    ),
                  ],
                )),
    );
  }

  Widget _loginButton(String path, VoidCallback onTap) {
    return Card(
      elevation: 5.0,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: Ink.image(
        image: AssetImage('asset/image/$path.png'),
        width: 60,
        height: 60,
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(35.0),
          ),
          onTap: onTap,
        ),
      ),
    );
  }

  Widget _logoutButton() {
    return ElevatedButton(
      onPressed: signOut,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(0xff0165E1),
        ),
      ),
      child: const Text('로그아웃'),
    );
  }
}

enum LoginPlatform {
  facebook,
  google,
  kakao,
  naver,
  apple,
  none,
}
