import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_sample/firebase_options.dart';
import 'package:flutter_social_sample/social/sign_in_with_apple.dart';
import 'package:flutter_social_sample/social/sign_in_with_facebook.dart';
import 'package:flutter_social_sample/social/sign_in_with_github.dart';
import 'package:flutter_social_sample/social/sign_in_with_google.dart';
import 'package:flutter_social_sample/social/sign_in_with_kakao.dart';
import 'package:flutter_social_sample/social/sign_in_with_naver.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(name: 'test', options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User?> user) {
          if (user.hasData) {
            return MainWidget(
              user: user.data!,
            );
          } else {
            return const LoginWidget();
          }
        },
      ),
    );
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('이메일 : ${user.providerData[0].email}'),
          const SizedBox(height: 20,),
          Text('로그인 경로 : ${user.providerData[0].providerId}'),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: const Text('로그아웃'),
          )
        ],
      ),
    );
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red
            ),
            child: const Text('구글 로그인'),
            onPressed: () => signInWithGoogle()
          ),
          const SizedBox(height: 16,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue
            ),
            onPressed: () => signInWithFacebook(),
            child: const Text('페이스북 로그인')
          ),
          if(Platform.isIOS)...[
            const SizedBox(height: 16,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white
              ),
              onPressed: () => signInWithApple(),
              child: const Text('애플 로그인', style: TextStyle(color: Colors.black),)
            ),
          ],
          const SizedBox(height: 16,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black
            ),
            onPressed: () => signInWithGitHub(context),
            child: const Text('깃허브 로그인')
          ),
          const SizedBox(height: 16,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NaverSampleScreen()),
              );
            },
            child: const Text('네이버 로그인')
          ),
          const SizedBox(height: 16,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow
            ),
            onPressed: () => signInWithKakao(),
            child: const Text('로그인 로그인', style: TextStyle(color: Colors.black))
          ),
        ],
      ),
    );
  }
}


