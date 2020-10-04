import 'package:Pokedex/network/http_client.dart';

abstract class HttpDao<T> {
  HttpClient client = HttpClient.getInstance();
}
