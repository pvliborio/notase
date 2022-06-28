import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notase/models/LocalLanguage.dart';
import 'package:notase/models/User.dart';
import 'package:notase/services/database_service.dart';
import 'package:notase/services/notification_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }

    return User(user.uid, user.email, user.displayName, user.photoURL);
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<User?> signIn(BuildContext context) async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final auth.AuthCredential credential = auth.GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final user = await _firebaseAuth.signInWithCredential(credential);

    await NotificationService().showLoginNotification();

    await DatabaseService().setLanguage(LocalLanguage(
        uid: user.user!.uid,
        actualLocale: AppLocalizations.of(context)!.localeName));

    return _userFromFirebase(user.user);
  }

  Future<void> signOut() async {
    await DatabaseService().deleteLanguage(_firebaseAuth.currentUser!.uid);
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
    await NotificationService().showLogoutNotification();
  }
}
