import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum AuthStatus { uninitialized, authenticated, unauthenticated }

class AuthenticationRepository extends ChangeNotifier {
  final SupabaseClient _client;
  AuthStatus _status = AuthStatus.uninitialized;

  User? _currentUser;

  User? get user => _currentUser;

  AuthStatus get status => _status;

  SupabaseClient get client => _client;

  AuthenticationRepository()
      : _client = SupabaseClient(
            dotenv.env["SUPABASE_URL"]!, dotenv.env["SUPABASE_ANON_KEY"]!) {

    _client.auth.onAuthStateChange.listen((data) {
      final event = data.event;

      if (event == AuthChangeEvent.signedIn ||
          event == AuthChangeEvent.tokenRefreshed) {
        getCurrentUser();
      } else if (event == AuthChangeEvent.signedOut) {
        _currentUser = null;
        _status = AuthStatus.unauthenticated;
        notifyListeners();
      }
    });
    getCurrentUser();
  }

// CREATE USER EMAIL AND PASSWORD
  Future<User?> createUser(
      {required String email, required String password}) async {
    try {
      final user = await _client.auth.signUp(email: email, password: password);
      _currentUser = user.user;
    } catch (e) {
      return null;
    } finally {
      notifyListeners();
    }
    return null;
  }

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
  Future<bool> signInWithProvider({required OAuthProvider provider}) async {
    try {
      final webClientId = dotenv.env["GOOGLE_CLIENT_ID"];
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: webClientId,
      );
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null) {
        throw 'No Access Token found.';
      }

      if (idToken == null) {
        throw 'No ID Token found.';
      }

      await _client.auth.signInWithIdToken(
        provider: provider,
        idToken: idToken,
        accessToken: accessToken,
      );
      await getCurrentUser();
      _status = AuthStatus.authenticated;
      return true;
    } catch (e) {
      return false;
    } finally {
      notifyListeners();
    }
  }

// CHECKS FOR REDIRECTS
// void listenForAuthRedirects() {
//   supabase
// }

// GET LOGGED IN USER
  getCurrentUser() async {
    try {
      final user = _client.auth.currentUser;
      if (user != null) {
        _status = AuthStatus.authenticated;
        _currentUser = user;
      }
    } catch (_) {
      _status = AuthStatus.unauthenticated;
    } finally {
      notifyListeners();
    }
  }

  Future<bool> logout() async {
    try {
      await _client.auth.signOut();
      _currentUser = null;
      _status = AuthStatus.unauthenticated;
      return true;
    } catch (e) {
      return false;
    } finally {
      notifyListeners();
    }
  }
}
