import 'package:flutter/material.dart';
import 'package:notase/models/User.dart';
import 'package:notase/res/custom_colors.dart';
import 'package:notase/services/auth_service.dart';
import 'package:notase/widgets/appbar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileRoute extends StatefulWidget {
  const ProfileRoute({Key? key}) : super(key: key);

  @override
  _ProfileRouteState createState() => _ProfileRouteState();
}

class _ProfileRouteState extends State<ProfileRoute> {
  bool _isSigningOut = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (user == null) {
            return const Scaffold(
              backgroundColor: CustomColors.orange,
            );
          }
          return Scaffold(
            backgroundColor: CustomColors.grey,
            appBar: CustomAppBar(AppLocalizations.of(context)!.seuPerfil),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(),
                    user.photoURL != null
                        ? ClipOval(
                            child: Material(
                              color: CustomColors.grey.withOpacity(0.3),
                              child: Image.network(
                                user.photoURL!,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          )
                        : ClipOval(
                            child: Material(
                              color: CustomColors.grey.withOpacity(0.3),
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Icon(
                                  Icons.person,
                                  size: 60,
                                  color: CustomColors.grey,
                                ),
                              ),
                            ),
                          ),
                    const SizedBox(height: 8.0),
                    Text(
                      user.displayName!,
                      style: const TextStyle(
                        color: CustomColors.navy,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '( ${user.email!} )',
                      style: const TextStyle(
                        color: CustomColors.navy,
                        fontSize: 20,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    _isSigningOut
                        ? const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                CustomColors.orange,
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              setState(() {
                                _isSigningOut = true;
                              });
                              await authService.signOut();
                              setState(() {
                                _isSigningOut = false;
                              });
                              Navigator.of(context).pushReplacementNamed('/');
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Text(
                                AppLocalizations.of(context)!.sair,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Scaffold(
            backgroundColor: CustomColors.orange,
          );
        }
      },
    );
  }
}
