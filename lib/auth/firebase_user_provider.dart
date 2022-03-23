import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AdagioVRFirebaseUser {
  AdagioVRFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

AdagioVRFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<AdagioVRFirebaseUser> adagioVRFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<AdagioVRFirebaseUser>(
            (user) => currentUser = AdagioVRFirebaseUser(user));
