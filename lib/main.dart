import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notase/res/custom_colors.dart';
import 'package:notase/routes/profile.dart';
import 'package:notase/routes/simulados.dart';
import 'package:notase/routes/wrapper.dart';
import 'package:notase/services/auth_service.dart';
import 'package:notase/services/database_service.dart';
import 'package:notase/services/notification_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationService().init();
  await DatabaseService().initDB();

  runApp(const NotaSE());
}

class NotaSE extends StatelessWidget {
  const NotaSE({Key? key}) : super(key: key);

  Route<dynamic> _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _buildRoute(settings, const WrapperRoute());
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
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (context) => AuthService(),
        )
      ],
      child: MaterialApp(
        title: 'NotaSE',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.orange,
            brightness: Brightness.dark,
            textTheme: const TextTheme(
                bodyText1: TextStyle(color: CustomColors.navy))),
        initialRoute: '/',
        onGenerateRoute: _getRoute,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
