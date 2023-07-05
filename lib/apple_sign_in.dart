import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: AppleSignInPage(),));
}
class AppleSignInPage extends StatefulWidget {
  const AppleSignInPage({Key? key}) : super(key: key);

  @override
  State<AppleSignInPage> createState() => _AppleSignInPageState();
}

class _AppleSignInPageState extends State<AppleSignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('Apple Sign-In'),
    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/a_logo.png',
              height: 100.0,
            ),
            SizedBox(height: 20.0),
            Text(
              'Sign in with Apple',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              child: Text('Sign In'),
              onPressed: () {},
            ),
          ],
        ),
      ),);
  }
}

