import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


void main() {
  runApp(MaterialApp(home: GoogleSignInPage(),));
}

class GoogleSignInPage extends StatefulWidget {
  @override
  _GoogleSignInPageState createState() => _GoogleSignInPageState();
}

class _GoogleSignInPageState extends State<GoogleSignInPage> {

  final GoogleSignIn _googleSignIn = GoogleSignIn();

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
              'assets/google_logo.png',
              height: 100.0,
            ),
            SizedBox(height: 20.0),
            Text(
              'Sign in with Google',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              child: Text('Sign In'),
              onPressed: _signInWithGoogle,
            ),
          ],
        ),
      ),
    );
  }

  void _signInWithGoogle() async {
    //try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      //final AuthCredential credential = GoogleAuthProvider.credential(
        //accessToken: googleAuth.accessToken,
        //idToken: googleAuth.idToken,
      //);
      // TODO: Use the credential to sign in to your app.
    }// catch (error) {
      //print(error);
    }
 // }
//}

mixin AuthCredential {
}

class GoogleAuthProvider {
 // //static AuthCredential credential({String? accessToken, String? idToken}) {}
}

//class AuthCredential {
//}



