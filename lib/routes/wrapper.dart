import 'package:flutter/material.dart';
import 'package:notase/models/User.dart';
import 'package:notase/routes/home.dart';
import 'package:notase/routes/signin.dart';
import 'package:notase/services/auth_service.dart';
import 'package:provider/provider.dart';

class WrapperRoute extends StatelessWidget {
  const WrapperRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          return user == null ? const SignInRoute() : const HomeRoute();
        } else {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
