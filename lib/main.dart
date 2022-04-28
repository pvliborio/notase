import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notase/routes/home.dart';
import 'package:notase/routes/profile.dart';
import 'package:notase/routes/simulados.dart';

import 'routes/signin.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const NotaSE());
}

class NotaSE extends StatelessWidget {
  const NotaSE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NotaSE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        brightness: Brightness.dark,
      ),
      initialRoute: FirebaseAuth.instance.currentUser == null ? '/signin' : '/',
      routes: {
        '/': (context) => const HomeRoute(),
        '/signin': (context) => const SignInRoute(),
        '/profile': (context) => ProfileRoute(),
        '/simulados':(context) => const SimuladosRoute()
      },
    );
  }
}