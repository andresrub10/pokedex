import 'package:Pokedex/controller/authentication/firebase/firebase_authentication_controller.dart';
import 'package:Pokedex/misc/app_response.dart';
import 'package:Pokedex/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;

class GetCurrentUserFirebaseAuthenticationController
    extends FirebaseAuthenticationController {
  //UserRepository _userRepository = locator<UserRepository>();

  Future<AppResponse<User>> process() async {
    FirebaseAuth.User current = firebaseAuth.currentUser;

    if (current != null) {
      return AppResponse.success(
          payload: User(
              id: current.uid,
              email: current.email,
              givenName: current.displayName,
              imageUrl: current.photoURL));
    } else {
      return AppResponse.failure(errorCode: ErrorCode.NO_USER_LOGGED);
    }
  }
}
