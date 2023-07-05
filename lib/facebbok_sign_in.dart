import 'package:flutter/material.dart';



void main() {
  runApp(MaterialApp(home: FacebookSignInPage(),));
}

class FacebookSignInPage extends StatefulWidget {
  @override
  _FacebookSignInPageState createState() => _FacebookSignInPageState();
}

class _FacebookSignInPageState extends State<FacebookSignInPage> {

  final FacebookSignIn _facebookSignIn = FacebookSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Sign-In'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/fb.png',
              height: 100.0,
            ),
            SizedBox(height: 20.0),
            Text(
              'Sign in with Facebook',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              child: Text('Sign In'),
              onPressed: _signInWithFacebook,
            ),
          ],
        ),
      ),
    );
  }

  void _signInWithFacebook() async {
    //try {
    final FacebookSignInAccount? googleUser = await _facebookSignIn.signIn();
    final FacebookSignInAuthentication googleAuth = await googleUser!.authentication;
    //final AuthCredential credential = GoogleAuthProvider.credential(
    //accessToken: googleAuth.accessToken,
    //idToken: googleAuth.idToken,
    //);
    // TODO: Use the credential to sign in to your app.
  }// catch (error) {
//print(error);
}

class FacebookSignIn {
  signIn() {}
}

class FacebookSignInAccount {
  get authentication => null;
}

class FacebookSignInAuthentication {
}
// }
//}

mixin AuthCredential {
}


//class AuthCredential {
//}



