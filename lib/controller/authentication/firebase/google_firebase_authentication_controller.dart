import 'package:Pokedex/controller/authentication/firebase/firebase_authentication_controller.dart';
import 'package:Pokedex/misc/app_response.dart';
import 'package:Pokedex/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
import 'package:google_sign_in/google_sign_in.dart';

class GoogleFirebaseAuthenticationController
    extends FirebaseAuthenticationController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<AppResponse<User>> process() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final FirebaseAuth.AuthCredential credential =
        FirebaseAuth.GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseAuth.User firebaseUser =
        (await firebaseAuth.signInWithCredential(credential)).user;

    return AppResponse.success(
        payload: User(
      id: firebaseUser.uid,
      givenName: firebaseUser.displayName,
      email: firebaseUser.email,
      imageUrl: firebaseUser.photoURL,
    ));
  }
}
