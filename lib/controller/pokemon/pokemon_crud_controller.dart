import 'package:Pokedex/controller/crud_controller.dart';
import 'package:Pokedex/data_access/repositories/pokemon/pokemon_repository.dart';
import 'package:Pokedex/misc/app_response.dart';
import 'package:Pokedex/misc/service_locator.dart';
import 'package:Pokedex/model/pokemon.dart';

class PokemonCrudController extends CrudController {
  PokemonRepository _repo = locator<PokemonRepository>();

  Future<AppResponse<List<Pokemon>>> getWithPagination(
      int limit, int offset) async {
    try {
      List<Pokemon> response = await _repo.getWithPagination(limit, offset);
      return AppResponse.success(payload: response);
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      return AppResponse.failure(errorCode: ErrorCode.UNKNOWN);
    }
  }

  //This methods are implemented as needed for entity crud management
  @override
  Future<AppResponse> create(toCreate) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<AppResponse> delete(String toDelete) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<AppResponse<List>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<AppResponse> getById(String toRead) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<AppResponse> update(toUpdate) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
