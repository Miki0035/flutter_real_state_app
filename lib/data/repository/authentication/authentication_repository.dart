import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
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
      print('Sign in started');
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      if (userAccount == null) {
        // User canceled the sign-in flow
        print("User cancelled the sign-in process.");
        return false;
      }
      print("Account selected: ${userAccount.email}");

      final GoogleSignInAuthentication googleAuth =
          await userAccount.authentication;

      print("Access token: ${googleAuth.accessToken}");
      print("ID token: ${googleAuth.idToken}");

      // Create  user credential
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      // store google credentials to firebase auth
      final result = await _auth.signInWithCredential(credentials);
      print("Firebase sign-in successful. UID: ${result.user?.uid}");
      return true;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.message}");
      return false;
    } on PlatformException catch (e) {
      print("PlatformException: ${e.code} - ${e.message}");
      return false;
    } catch (e) {
      print("Unknown exception: $e");
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
