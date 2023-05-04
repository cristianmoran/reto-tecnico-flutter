import 'package:reto_tecnico/src/datasources/remote/characters_remote.dart';
import 'package:reto_tecnico/src/model/characters_request.dart';
import 'package:reto_tecnico/src/utils/constants.dart';

import '../rest/resultado_state.dart';

class GetCharactersUseCase {
  final CharactersRemote _charactersRemote;

  GetCharactersUseCase(this._charactersRemote);

  Future<ResultadoState> execute() {
    final timeStamp = getTimeStamp().toString();
    final hash = generateMd5("$timeStamp$privateKey$publicKey");
    final request = GetCharactersRequest(hash: hash, ts: timeStamp);
    return _charactersRemote.getCharacters(request);
  }
}
