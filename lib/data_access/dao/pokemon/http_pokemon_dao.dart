import 'package:Pokedex/data_access/dao/http_dao.dart';
import 'package:Pokedex/data_access/dao/pokemon/i_pokemon_dao.dart';
import 'package:Pokedex/model/pokemon.dart';
import 'package:dio/dio.dart';

class HttpPokemonDao extends HttpDao implements IPokemonDao {
  @override
  Future<List<Pokemon>> getWithPagination(int limit, int offset) async {
    List<Pokemon> output = List<Pokemon>();
    Response response =
        await client.get("/pokemon", {"limit": limit, "offset": offset});

    List<Future> futures = List<Future>();
    for (dynamic actual in response.data["results"]) {
      List<String> splittedUrl = (actual["url"] as String).split("/");

      int pokemonNumber = int.parse(splittedUrl[splittedUrl.length - 2]);

      futures.add(getById(pokemonNumber));
    }

    var responses = await Future.wait(futures);

    for (Pokemon actualPokemon in responses) {
      output.add(actualPokemon);
    }
    return output;
  }

  @override
  Future<Pokemon> getById(int id) async {
    Response response = await client.get("/pokemon/" + id.toString(), null);
    List<String> types = List<String>();
    dynamic actual = response.data;
    for (dynamic actualType in actual["types"]) {
      types.add(actualType["type"]["name"]);
    }
    String mainImageUrl;

    if (actual["sprites"]["other"]["official-artwork"]["front_default"] !=
        null) {
      mainImageUrl = actual["sprites"]["other"]["official-artwork"]["front_defa"
          "ult"];
    } else {
      mainImageUrl = actual["sprites"]["front_default"];
    }

    return Pokemon(
        actual["id"],
        actual["name"],
        actual["height"],
        actual["weight"],
        mainImageUrl,
        actual["sprites"]["front_default"],
        types,
        await getFlavorText(id));
  }

  @override
  Future<String> getFlavorText(int id) async {
    Response response =
        await client.get("/pokemon-species/" + id.toString(), null);
    dynamic actual = response.data;
    String output = actual["flavor_text_entries"][0]["flavor_text"]
        .toString()
        .replaceAll("\n", " ")
        .replaceAll("\f", " ");
    return output;
  }
}
