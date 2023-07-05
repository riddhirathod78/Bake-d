


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sp/as.dart';
import 'package:sp/googlr_sign_in.dart';
import 'package:sp/t_c.dart';
import 'package:sp/welcome.dart';
import 'apple_sign_in.dart';
import 'facebbok_sign_in.dart';
import 'main.dart';
import 'sign_in.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MaterialApp(home: SignUpPage(),));
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController _usernameController= new TextEditingController();
  TextEditingController contact_no= new TextEditingController();
  TextEditingController Address= new TextEditingController();
  TextEditingController Area= new TextEditingController();
  TextEditingController City= new TextEditingController();
  TextEditingController Pincode= new TextEditingController();
  TextEditingController Email= new TextEditingController();
  TextEditingController _dateController = new TextEditingController();
  final _passwordController = TextEditingController();


  Future<void> insertrecord() async {
    if(_usernameController.text!="" || contact_no.text!="" || Address.text!="" || Area.text!="" ||
    City.text!="" || City.text!="" || Pincode.text!="" || Email.text!="" ||
    _dateController.text!="" || _passwordController.text!="")
    {
        try{

          String uri = "http://192.168.1.2/bbaked_api/insert_record.php";

          var res=await http.post(Uri.parse(uri),
              body:{
                "Name":_usernameController.text,
                "contact_no":contact_no.text,
                "Address":Address.text,
                "Area":Area.text,
                "City":City.text,
                "Pincode":Pincode.text,
                "Email":Email.text,
                "_dateController":_dateController.text,
                "_passwordController":_passwordController.text
              });

          var response=jsonDecode(res.body);
          if(response["success"]=="true")
          {
            print("Record Inserted Successfully");
            _usernameController.text="";
            contact_no.text="";
            Address.text="";
            Area.text="";
            City.text="";
            Pincode.text="";
            Email.text="";
            _dateController.text="";
            _passwordController.text="";

          }
          else{
            print("Try Again");
          }
        }
        catch(e){
          print(e);
        }
    }
    else {
      print("please fill all the fields");
    }
    
  }

  final _formKey = GlobalKey<FormState>();


  String? _selectedDomain = '@gmail.com'; // Default selected domain

  final List<String> _domains = [  '@gmail.com',  '@yahoo.com',
      '@outlook.com',  '@icloud.com',]; // List of available domains

  bool _isPasswordVisible = false;

   DateTime _selectedDate=DateTime.now();

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _showDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
         _selectedDate = pickedDate;
         _dateController.text='${_selectedDate.day}/'
             '${_selectedDate.month}/${_selectedDate.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),

            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      'Create an Account',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  TextFormField(
                    controller: _usernameController,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),],
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                     validator: (value) {
                       if (value!.isEmpty) {
                         return 'Please enter your name';
                       }
                       return null;
                     },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: contact_no,
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10)
                    ],

                    decoration: InputDecoration(
                      labelText: 'Contact Number',
                    ),
                     validator: (value) {
                       if (value!.isEmpty) {
                         return 'Please enter your contact number';
                       }
                       return null;
                     },
                  ),
                  SizedBox(height: 16),
                  GestureDetector(

                    onTap: _showDatePicker,
                    child: AbsorbPointer(
                      child: TextField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          labelText: 'Date of Birth',
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: Address,
                    decoration: InputDecoration(
                      labelText: 'Address',
                    ),
                     validator: (value) {
                       if (value!.isEmpty) {
                         return 'Please enter your address';
                       }
                       return null;
                     },
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: Area,
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),],
                          decoration: InputDecoration(
                            labelText: 'Area',
                          ),
                           validator: (value) {
                             if (value!.isEmpty) {
                               return 'Please enter your area';
                             }
                             return null;
                           },
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: City,
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),],
                          decoration: InputDecoration(
                            labelText: 'City',
                          ),
                           validator: (value) {
                           if (value!.isEmpty) {
                           return 'Please enter your city';
                           }
                           return null;
                           },
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: Pincode,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(6)
                          ],
                          decoration: InputDecoration(
                            labelText: 'Pincode',
                          ),
                           validator: (value) {
                             if (value?.isEmpty ?? true) {
                               return 'Please enter your pincode';
                             }
                             return null;
                           },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: Email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(

                      labelText: 'Email ID',
                      suffixIcon: DropdownButton<String>(
                        value: _selectedDomain,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedDomain = value;
                          });
                        },
                        items: _domains
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                            .toList(),
                      ),

                    ),
                     validator: (value) {
                       if (value!.isEmpty) {
                         return 'Please enter your email';
                       } else if (!RegExp(r'^\S+$').hasMatch(value!)) {
                         return 'Please enter a valid email';
                       }
                       return null;
                     },
                    onSaved: (value) => Email.text = value!,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    inputFormatters:
                    [FilteringTextInputFormatter.singleLineFormatter,LengthLimitingTextInputFormatter(20)],
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',

                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),
                    ),
                     validator: (value) {
                       if (value!.isEmpty) {
                         return 'Please enter a password';
                       } else if (value.length < 8) {
                         return 'Password must be at least 8 characters';
                       }
                       return null;
                     },
                  ),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      insertrecord();
                      if (_usernameController.text.isEmpty || _passwordController.text.isEmpty ||
                      contact_no.text.isEmpty || Address.text.isEmpty || Area.text.isEmpty
                      || City.text.isEmpty || Pincode.text.isEmpty || Email.text.isEmpty ||
                      _dateController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Please fill in all fields.'),
                        ));
                        return;
                      }


                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FunPage()),
                      );

                    },
                    child: Text('Sign Up'),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('By signing up, you agree to our '),
                    ],
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TermsAndConditionsPage()),
                        );
                      },
                      child: Text(
                        'Terms and Conditions',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account? '),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignInPage()),
                          );
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        'OR',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Divider(
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GoogleSignInPage()),
                          );
                        },
                        icon: Icon(Icons.g_mobiledata_rounded),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AppleSignInPage()),
                          );
                        },
                        icon: Icon(Icons.apple),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FacebookSignInPage()),
                          );
                        },
                        icon:Icon(Icons.facebook),
                      ),
                    ],
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




