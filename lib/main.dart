import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notase/res/custom_colors.dart';
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

  Route<dynamic> _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _buildRoute(settings, const HomeRoute());
      case '/signin':
        return _buildRoute(settings, const SignInRoute());
      case '/profile':
        return _buildRoute(settings, const ProfileRoute());
      case '/simulados':
        final args = settings.arguments as SimuladosArguments;
        return _buildRoute(
            settings, SimuladosRoute(id: args.id, title: args.title));
    }

    throw Exception("Not found");
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NotaSE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.orange,
          brightness: Brightness.dark,
          textTheme:
              const TextTheme(bodyText1: TextStyle(color: CustomColors.navy))),
      initialRoute: FirebaseAuth.instance.currentUser == null ? '/signin' : '/',
      onGenerateRoute: _getRoute,
      // routes: {
      //   '/': (context) => const HomeRoute(),
      //   '/signin': (context) => const SignInRoute(),
      //   '/profile': (context) => const ProfileRoute(),
      //   '/simulados':(context) => const SimuladosRoute()
      // },
    );
  }
}
