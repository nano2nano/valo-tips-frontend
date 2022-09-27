import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailInputController = TextEditingController();
    final passwordInputController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("ログイン"),
      ),
      body: SafeArea(
        child: Center(
          child: Form(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 24.0),
                  TextFormField(
                    controller: emailInputController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  TextFormField(
                    controller: passwordInputController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 24.0),
                  Center(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: CommonButton(
                            // onPressed: () async {
                            //   var email = emailInputController.text;
                            //   var password = passwordInputController.text;
                            //   await FirebaseAuth.instance.signInAnonymously();
                            // },
                            onPressed: null,
                            child: Text('ログイン'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: CommonButton(
                            onPressed: () {
                              FirebaseAuth.instance.signInAnonymously();
                            },
                            child: const Text('ログインせずに利用する'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CommonButton extends StatelessWidget {
  const CommonButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.style,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget? child;
  final ButtonStyle? style;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 200,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: child,
      ),
    );
  }
}
