import 'package:Pokedex/data_access/dao/pokemon/http_pokemon_dao.dart';
import 'package:Pokedex/model/pokemon.dart';

class PokemonRepository {
  HttpPokemonDao dao = new HttpPokemonDao();

  Future<List<Pokemon>> getWithPagination(int limit, int offset) async {
    return await dao.getWithPagination(limit, offset);
  }

  Future<Pokemon> getById(id) async {
    return await dao.getById(id);
  }
}
