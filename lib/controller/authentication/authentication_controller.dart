import 'package:Pokedex/controller/authentication/firebase/firebase_authentication_controller.dart';
import 'package:Pokedex/controller/controller.dart';
import 'package:Pokedex/misc/app_response.dart';
import 'package:Pokedex/misc/logged_user_helper.dart';
import 'package:Pokedex/misc/service_locator.dart';
import 'package:Pokedex/model/user.dart';
import 'package:Pokedex/navigators/app_navigator/app_navigator.dart';

class AuthenticationController extends Controller {
  AppNavigator _appNavigator = locator<AppNavigator>();
  FirebaseAuthenticationController fac;

  AuthenticationController(this.fac);

  Future<AppResponse<void>> process() async {
    AppResponse<User> authResponse = await fac.process();

    if (authResponse.isSuccess()) {
      LoggedUserHelper.setLoggedUser(authResponse.payload);
      _appNavigator.toDashboard();
    } else {
      _appNavigator.toAuthentication();
      return AppResponse.failure(errorCode: ErrorCode.UNKNOWN);
    }
  }
}
