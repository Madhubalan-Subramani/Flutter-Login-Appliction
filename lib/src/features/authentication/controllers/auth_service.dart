import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // create new account with email and password
  Future<String> createAccountWithEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return "Account Created";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  // login with email and password
  Future<String> loginWithEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return "LoggedIn Successfully";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  // logout the user
  Future<String> logout() async {
    await FirebaseAuth.instance.signOut();
    return "Logout Successfully";
  }

  // Reset password
  Future<String> resetPasswordEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return "reset Password Successfully";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  // check whether the user is sign in or not
  Future<bool> isLoggedIn() async {
    var user = FirebaseAuth.instance.currentUser;
    return user != null;
  }
}
