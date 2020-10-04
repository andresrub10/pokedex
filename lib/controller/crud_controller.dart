import 'package:Pokedex/misc/app_response.dart';

abstract class CrudController<T> {
  Future<AppResponse<T>> create(T toCreate);
  Future<AppResponse> update(T toUpdate);
  Future<AppResponse<T>> getById(String toRead);
  Future<AppResponse<List<T>>> getAll();
  Future<AppResponse> delete(String toDelete);
}
