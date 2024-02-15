import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wealthwise/%20%20user_auth/firebase_auth_implementation/firebase_auth_service.dart';
import 'package:wealthwise/screen/home_screen.dart';
import 'package:wealthwise/screen/sign_in_page.dart';

class sign_up extends StatefulWidget {
  const sign_up({super.key});

  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                forceMaterialTransparency: true,
                centerTitle: false,
                backgroundColor: Color(0xFFF7F7F7),
                elevation: 0,
                title: Text(
                  'Sign up',
                  style: TextStyle(
                      color: Color(0xFF041727),
                      fontFamily: 'Montserrat',
                      fontSize: 32,
                      fontWeight: FontWeight.w700),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.only(top: 28, left: 20, right: 20),
                child: Column(
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: Stack(children: [
                          //image in container
                          Container(
                            width: 146,
                            height: 146,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset('assets/image/man 1.png'),
                          ),

                          //change image icon
                          Positioned(
                            top: 114,
                            left: 101,
                            right: 5,
                            child: Container(
                              height: 40,
                              width: 40,
                              child: Image.asset('assets/image/add.png'),
                            ),
                          ),
                        ]),
                      ),
                    ),

                    //text field for email
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: TextField(
                        controller: _emailController,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(166, 166, 166, 1)),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(166, 166, 166, 1))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(3, 127, 255, 1))),
                          contentPadding:
                              EdgeInsets.only(top: 31, bottom: 32, left: 16),
                          labelText: 'Email address',
                          hintText: 'example@gmail.com',
                        ),
                      ),
                    ),

                    //text field for username
                    Container(
                      margin: EdgeInsets.only(top: 24),
                      child: TextField(
                        controller: _usernameController,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(166, 166, 166, 1)),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(166, 166, 166, 1))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(3, 127, 255, 1))),
                          contentPadding:
                              EdgeInsets.only(top: 31, bottom: 32, left: 16),
                          labelText: 'Username',
                          hintText: 'Example',
                        ),
                      ),
                    ),

                    //Password
                    Container(
                      margin: EdgeInsets.only(top: 24),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(166, 166, 166, 1)),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(166, 166, 166, 1))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(3, 127, 255, 1))),
                          contentPadding:
                              EdgeInsets.only(top: 31, bottom: 32, left: 16),
                          labelText: 'Password',
                          hintText: '12345678',
                        ),
                      ),
                    ),

                    //Button
                    GestureDetector(
                      onTap: _signUp,
                      child: Container(
                        margin: EdgeInsets.only(top: 64),
                        height: 72,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color.fromRGBO(3, 127, 255, 1),
                        ),
                        child: Center(
                            child: Text(
                          'Sign up',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                      ),
                    ),

                    //Sign in
                    Container(
                      margin: EdgeInsets.only(top: 32),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignIn()));
                        },
                        child: RichText(
                          text: TextSpan(
                              text: 'Already have an account?',
                              style: TextStyle(
                                  color: Color.fromRGBO(166, 166, 166, 1),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600),
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' Sign in',
                                    style: TextStyle(
                                        color: Color.fromRGBO(3, 127, 255, 1),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600))
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }

  void _signUp() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      print('User is Sucessfully Craeted');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const home_page()));
    } else {
      print("some error happened");
    }
  }
}
