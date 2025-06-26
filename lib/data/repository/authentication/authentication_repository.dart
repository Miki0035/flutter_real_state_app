import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;

  User? get user => _auth.currentUser;

  final List<String> scopes = <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  AuthenticationRepository();

// CREATE USER EMAIL AND PASSWORD
//   Future<User?> createUser(
//       {required String email, required String password}) async {
//     try {
//       final user = await _client.auth.signUp(email: email, password: password);
//       _currentUser = user.user;
//     } catch (e) {
//       return null;
//     } finally {
//       notifyListeners();
//     }
//     return null;
//   }

// CREATE EMAIL SESSION
//   Future<Session?> createEmailSession(
//       {required String email, required String password}) async {
//     try {
//       final session = await _account.createEmailPasswordSession(
//           email: email, password: password);
//       _currentUser = await _account.get();
//       _status = AuthStatus.authenticated;
//       return session;
//     } catch (e) {
//       print("Error in createEmailSession: $e");
//       return null;
//     } finally {
//       notifyListeners();
//     }
//   }

//SIGN IN WITH PROVIDER
  Future<bool> signInWithProvider() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      // Create  user credential
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // store google credentials to firebase auth
      await _auth.signInWithCredential(credentials);
      return true;
    } on FirebaseAuthException catch (_) {
      return false;
    } finally {
      notifyListeners();
    }
  }

// CHECKS FOR REDIRECTS
// void listenForAuthRedirects() {
// }

// GET LOGGED IN USER

  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await _auth.signOut();
    } on FirebaseAuthException catch (_) {
      rethrow;
    } finally {
      notifyListeners();
    }
  }
}
