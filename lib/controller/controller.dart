import 'package:Pokedex/misc/app_response.dart';

abstract class Controller {
  Future<AppResponse> process();
}
