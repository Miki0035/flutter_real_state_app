import 'package:appwrite/appwrite.dart';
import 'package:appwrite/enums.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:real_state_app/utilis/popups/full_screen_loader.dart';

enum AuthStatus { uninitialized, authenticated, unauthenticated }

class AuthenticationRepository extends ChangeNotifier {
  final Client _client = Client();
  late final Account _account;

  AuthStatus _status = AuthStatus.uninitialized;

  User? _currentUser;

  User? get user => _currentUser;

  AuthStatus get status => _status;

  AuthenticationRepository() {
    _init();
    getCurrentUser();
  }

  void _init() async {
    _client
      ..setEndpoint(dotenv.env["APP_WRITE_ENDPOINT"] ?? "")
      ..setProject(dotenv.env["APP_WRITE_PROJECT_ID"] ?? "");
    _account = Account(_client);
  }

  // CREATE USER EMAIL AND PASSWORD
  Future<User> createUser(
      {required String email, required String password}) async {
    try {
      final user = await _account.create(
          userId: ID.unique(), email: email, password: password, name: email);
      return user;
    } catch (e) {
      throw e;
    } finally {
      notifyListeners();
    }
  }

  // CREATE EMAIL SESSION
  Future<Session> createEmailSession(
      {required String email, required String password}) async {
    try {
      final session = await _account.createEmailPasswordSession(
          email: email, password: password);
      _currentUser = await _account.get();
      _status = AuthStatus.authenticated;
      return session;
    } catch (e) {
      throw e;
    } finally {
      notifyListeners();
    }
  }

  // SIGIN

  //SIGN IN WITH PROVIDER
  Future<void> signInWithProvider(
      {required OAuthProvider provider, required BuildContext context}) async {
    try {
      MFullScreenLoader.openLoadingDialog(context);
      await _account.createOAuth2Session(
          provider: provider, success: "http://localhost:50233/");
      _currentUser = await _account.get();
      _status = AuthStatus.authenticated;
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (_) => MBottomNavigation()),
      //     (Route<dynamic> route) => false);
    } catch (e) {
      rethrow;
    } finally {
      notifyListeners();
      if (context.mounted) {
        MFullScreenLoader.stopLoadingDialog(context);
      }
    }
  }

  //
  // // CHECKS FOR REDIRECTS
  // void listenForAuthRedirects() {
  //   uriLinkStream.listen((Uri? uri) async {
  //     if (uri != null && uri.scheme == 'ReState') {
  //       _user = await getCurrentUser();
  //       notifyListeners();
  //     }
  //   });
  // }

  // GET LOGGED IN USER
  getCurrentUser() async {
    try {
      final user = await _account.get();
      _status = AuthStatus.authenticated;
      _currentUser = user;
    } catch (_) {
      _status = AuthStatus.unauthenticated;
    } finally {
      notifyListeners();
    }
  }

  Future<void> logout() async {
    try {
      await _account.deleteSessions();
      _currentUser = null;
      _status = AuthStatus.unauthenticated;
    } finally {
      notifyListeners();
    }
  }
}
