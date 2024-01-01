import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wealthwise/firebase_options.dart';
import 'package:wealthwise/screen/spalsh_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialise app based on platform- web or mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDHG6m5FUD-vq54FJ7bonzLx5c0Pxj2gtE",
        appId: "1:866442811079:web:93288a12f4a5e5967190e2",
        messagingSenderId: "866442811079",
        projectId: "wealthwise-34466",
        storageBucket: "wealthwise-34466.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 0, 0)),
        useMaterial3: true,
      ),
      home: splash_screen(),
    );
  }
}