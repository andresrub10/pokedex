import 'package:Pokedex/controller/authentication/firebase/firebase_authentication_controller.dart';
import 'package:Pokedex/misc/app_response.dart';

class SignOutFirebaseAuthenticationController
    extends FirebaseAuthenticationController {
  Future<AppResponse<void>> process() async {
    await firebaseAuth.signOut();
    return AppResponse.success();
  }
}
