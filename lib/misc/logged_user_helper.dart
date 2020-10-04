import 'package:Pokedex/misc/service_locator.dart';
import 'package:Pokedex/model/user.dart';

class LoggedUserHelper {
  static void setLoggedUser(User userToSet) {
    locator<User>().equalizeWith(userToSet);
  }

  static User getLoggedUser() {
    return locator<User>();
  }

  static bool isUserLogged() {
    return locator<User>().id != "";
  }
}
