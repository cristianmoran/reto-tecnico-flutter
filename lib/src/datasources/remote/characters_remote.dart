import '../../model/characters_request.dart';
import '../../rest/rest_api.dart';
import '../../rest/resultado_state.dart';

class CharactersRemote {
  RestApi restApi = RestApi();

  Future<ResultadoState> getCharacters(GetCharactersRequest request) async {
    final ResultadoState response = await restApi.createGET(
        path: "v1/public/characters", queryParams: request.toJson());
    return response;
  }

  Future<ResultadoState> getComicsOfCharacter(
      GetCharactersRequest request, String characterId) async {
    final ResultadoState response = await restApi.createGET(
        path: "v1/public/characters/$characterId/comics",
        queryParams: request.toJson());
    return response;
  }

  Future<ResultadoState> getEventsOfCharacter(
      GetCharactersRequest request, String characterId) async {
    final ResultadoState response = await restApi.createGET(
        path: "v1/public/characters/$characterId/events",
        queryParams: request.toJson());
    return response;
  }

  Future<ResultadoState> getSeriesOfCharacter(
      GetCharactersRequest request, String characterId) async {
    final ResultadoState response = await restApi.createGET(
        path: "v1/public/characters/$characterId/series",
        queryParams: request.toJson());
    return response;
  }

  Future<ResultadoState> getStoriesOfCharacter(
      GetCharactersRequest request, String characterId) async {
    final ResultadoState response = await restApi.createGET(
        path: "v1/public/characters/$characterId/stories",
        queryParams: request.toJson());
    return response;
  }
}
