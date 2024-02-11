import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wealthwise/%20%20user_auth/firebase_auth_implementation/firebase_auth_service.dart';
import 'package:wealthwise/screen/home_screen.dart';
import 'package:wealthwise/screen/sign_up_page.dart';


class sign_in extends StatefulWidget {
  const sign_in({super.key});

  @override
  State<sign_in> createState() => _sign_inState();
}

class _sign_inState extends State<sign_in> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();

  
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
   
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
              'Sign in',
              style: TextStyle(
                  color: Color(0xFF041727),
                  fontFamily: 'Montserrat',
                  fontSize: 32,
                  fontWeight: FontWeight.w700),
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 128.0, left: 20, right: 20),
              child: Column(
                children: [
                  //Email
                  Container(
                    margin: EdgeInsets.only(top: 32),
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
                  Container(
                      margin: EdgeInsets.only(top: 192),
                      child: GestureDetector(
                        onTap: _signIn,
                        child: Container(
                          height: 72,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Color.fromRGBO(3, 127, 255, 1),
                          ),
                          child: Center(
                              child: Text(
                            'Sign in',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                        ),
                      )),

                  //Sign up
                  Container(
                    margin: EdgeInsets.only(top: 32),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => sign_up()));
                      },
                      child: RichText(
                        text: TextSpan(
                            text: 'Don’t have an account?',
                            style: TextStyle(
                                color: Color.fromRGBO(166, 166, 166, 1),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Sign up',
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
          ),
        ),
      ),
    );
  }

  void _signIn() async {
  
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      print('User is Sucessfully Craeted');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const home_page()));
    } else {
      print("some error happened");
    }
  }
}

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;



  String? getCurrentUserEmail() {
    User? user = _auth.currentUser;
    return user?.email;
  }
}
