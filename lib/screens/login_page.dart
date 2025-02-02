import 'package:flutter/material.dart';
import 'package:login/widgets/login_widget.dart';
import 'package:login/services/login_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: LoginWidget(
        title: 'Hello, Welcome to Flutter Login Page',
        usernameHint: 'Username',
        passwordHint: 'Password',
        loginButtonText: 'Login',
      ),
    );
  }
}
