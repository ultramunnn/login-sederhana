import 'package:flutter/material.dart';
import 'package:login/services/login_service.dart';

class LoginWidget extends StatelessWidget {
  final String title;
  final String usernameHint;
  final String passwordHint;
  final String loginButtonText;
  final void Function(String username, String password)? onLogin;

  const LoginWidget({
    Key? key,
    required this.title,
    required this.usernameHint,
    required this.passwordHint,
    required this.loginButtonText,
    this.onLogin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
              labelText: usernameHint,
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: passwordHint,
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () async {
              String username = usernameController.text;
              String password = passwordController.text;

              Map<String, dynamic> result =
                  await LoginService().loginUser(username, password);
              if (result.containsKey('error')) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(result['error'])));
              } else {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => HomePage()));
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Login Berhasil')));
              }

              print('User Data: ${result}');
            },
            child: Text(loginButtonText),
          ),
        ],
      ),
    );
  }
}
