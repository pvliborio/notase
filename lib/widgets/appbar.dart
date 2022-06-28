import 'package:flutter/material.dart';
import 'package:notase/models/User.dart';
import 'package:notase/res/custom_colors.dart';
import 'package:notase/services/auth_service.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;

  CustomAppBar(
    this.title, {
    Key? key,
  })  : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (user == null) {
            return AppBar(
              title: Text(
                title,
                style: const TextStyle(color: CustomColors.grey),
              ),
              actions: [
                Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () {
                        ModalRoute.of(context)?.settings.name != "/profile"
                            ? Navigator.of(context).pushNamed("/profile")
                            : null;
                      },
                      child: CircleAvatar(
                        backgroundColor: CustomColors.grey.withOpacity(0.3),
                      ),
                    ))
              ],
              backgroundColor: CustomColors.orange,
              automaticallyImplyLeading: true,
            );
          }
          return AppBar(
            title: Text(
              title,
              style: const TextStyle(color: CustomColors.grey),
            ),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                      onTap: () {
                        ModalRoute.of(context)?.settings.name != "/profile"
                            ? Navigator.of(context).pushNamed("/profile")
                            : null;
                      },
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(user.photoURL!),
                        backgroundColor: CustomColors.grey.withOpacity(0.3),
                      )))
            ],
            backgroundColor: CustomColors.orange,
            automaticallyImplyLeading: true,
          );
        } else {
          return AppBar(
            title: Text(
              title,
              style: const TextStyle(color: CustomColors.grey),
            ),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () {
                      ModalRoute.of(context)?.settings.name != "/profile"
                          ? Navigator.of(context).pushNamed("/profile")
                          : null;
                    },
                    child: CircleAvatar(
                      backgroundColor: CustomColors.grey.withOpacity(0.3),
                    ),
                  ))
            ],
            backgroundColor: CustomColors.orange,
            automaticallyImplyLeading: true,
          );
        }
      },
    );
  }
}
