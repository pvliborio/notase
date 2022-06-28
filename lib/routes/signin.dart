import 'package:flutter/material.dart';
import 'package:notase/res/custom_colors.dart';
import 'package:notase/services/auth_service.dart';
import 'package:notase/widgets/signin_Button.dart';
import 'package:provider/provider.dart';

class SignInRoute extends StatefulWidget {
  const SignInRoute({Key? key}) : super(key: key);

  @override
  _SignInRouteState createState() => _SignInRouteState();
}

class _SignInRouteState extends State<SignInRoute> {
  @override
  Widget build(BuildContext context) {
    final AuthService _authService = Provider.of<AuthService>(context);

    return Scaffold(
      backgroundColor: CustomColors.orange,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'NotaSE',
                      style: TextStyle(
                        color: CustomColors.grey,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
              GoogleSignInButton(
                authService: _authService,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
