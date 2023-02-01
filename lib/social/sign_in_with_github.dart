import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:github_sign_in/github_sign_in.dart';

Future<UserCredential> signInWithGitHub(BuildContext context) async {
  // Create a GitHubSignIn instance
  final GitHubSignIn gitHubSignIn = GitHubSignIn(
    clientId: '3306bd6c9adccd0f1959',
    clientSecret: '0fe1dd34b3dc4cb05975ea404232f4c34fa4edde',
    redirectUrl: 'https://flutter-social-login-sam-50272.firebaseapp.com/__/auth/handler',
  );

  // Trigger the sign-in flow
  final result = await gitHubSignIn.signIn(context);

  // Create a credential from the access token
  final githubAuthCredential = GithubAuthProvider.credential(result.token!);

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(githubAuthCredential);
}
