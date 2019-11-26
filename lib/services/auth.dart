import 'package:firebase_auth/firebase_auth.dart';
import 'package:ninja_brew/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user object from Firebase user response
  User _userFromFirebaseResponse(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // Auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseResponse);
  }

  // Anon sign in
  Future anonSignIn() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;

      return _userFromFirebaseResponse(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // Email sign in

  // Email register

  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
