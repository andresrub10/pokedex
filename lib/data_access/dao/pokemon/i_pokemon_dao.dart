import 'package:Pokedex/data_access/dao/dao.dart';
import 'package:Pokedex/model/pokemon.dart';

abstract class IPokemonDao extends Dao<Pokemon> {
  Future<List<Pokemon>> getWithPagination(int limit, int offset);
  Future<Pokemon> getById(int id);
  Future<String> getFlavorText(int id);
}
