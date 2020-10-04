import 'package:Pokedex/data_access/repositories/pokemon/pokemon_repository.dart';
import 'package:Pokedex/model/user.dart';
import 'package:Pokedex/navigators/app_navigator/app_navigator.dart';
import 'package:Pokedex/navigators/game_navigator/game_navigator.dart';
import 'package:Pokedex/navigators/pokedex_navigator/pokedex_navigator.dart';
import 'package:Pokedex/navigators/settings_navigator/settings_navigator.dart';
import 'package:get_it/get_it.dart';

final ServiceLocator locator = ServiceLocator._();

/// Convenience wrapper around GetIt.
class ServiceLocator<T> {
  ServiceLocator._();

  final GetIt _getIt = GetIt.instance;

  T call<T>() => _getIt<T>();

  Future<void> registerDependencies() async {
    //Navigators Start
    _getIt.registerSingleton(AppNavigator());
    _getIt.registerSingleton(PokedexNavigator());
    _getIt.registerSingleton(GameNavigator());
    _getIt.registerSingleton(SettingsNavigator());
    //Navigator end

    //For session management
    _getIt.registerSingleton(User());

    //Repositories begin
    _getIt.registerSingleton(PokemonRepository());
    //Repositories end
  }
}
