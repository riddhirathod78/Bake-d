import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'apple_sign_in.dart';
import 'as.dart';
import 'facebbok_sign_in.dart';
import 'forgot_pass.dart';
import 'googlr_sign_in.dart';
import 'sign_up.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(home: SignInPage(),));
}

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _message = "";

  Future<void> _signIn() async {
    // make HTTP POST request to PHP script
    final url = Uri.parse('http://192.168.1.2/bbaked_api/login_record.php');
    final response = await http.post(url, body: {
      '_usernameController': _usernameController.text,
      '_passwordController': _passwordController.text,
    });

    // check the response
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'success') {
        setState(() {
          _message = "Login successful";
        });

        // valid credentials
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FunPage()));
      } else {
        setState(() {
          _message = "Invalid";
        });
      }
    } else {
      setState(() {
        _message = "Failed";
      });
    }
  }


//   Future<void> _signIn() async {
// // make HTTP POST request to PHP script
//     final url = Uri.parse('http://192.168.1.2/bbaked_api/login_record.php');
//     final response = await http.post(url, body: {
//       'uname': _usernameController.text,
//       'upass': _passwordController.text,
//     });
//
// // check the response
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       if (data['status'] == 'success') {
//         setState(() {
//           _message = "Login successful";
//         });
//
//         // valid credentials
//         Navigator.push(context, MaterialPageRoute(builder: (context) => FunPage()),
//         );
//       };
//     } else {
//       setState(() {
//         _message = "Invalid";
//       }
//       );
//     } else {
//         setState(() {
//           _message = "Failed";
//       });
//     }
//   }
    // invalid credentials
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text('Invalid username or password.'),
//     ));
//   }
// }



  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/baked_logo.png', height: 220.0,),
              SizedBox(height: 16),
              TextFormField(
                controller: _usernameController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                ],
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                inputFormatters: [LengthLimitingTextInputFormatter(20)],
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible ? Icons.visibility_off : Icons
                          .visibility,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                  border: OutlineInputBorder(),
                ),

              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            ForgotPasswordPage()),
                      );
                    },
                    child: Text('Forgot Password?'),
                  ),
                ],
              ),
              SizedBox(height: 32),
              ElevatedButton(onPressed: () {
                if (_usernameController.text.isEmpty ||
                    _passwordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Please fill in all fields.'),
                  ));
                  return;
                }
                //
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FunPage()),
                );
              },
                child: Text('Sign In'),
              ),
              SizedBox(height: 16),
              Text(
                'or sign in with',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
// Google button
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.g_mobiledata_rounded),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GoogleSignInPage()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 16),

// Apple button
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.apple),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppleSignInPage()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 16),

// Facebook button
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.facebook),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FacebookSignInPage()),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
