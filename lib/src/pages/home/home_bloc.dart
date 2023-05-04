import 'package:reto_tecnico/src/usecase/get_characters_usecase.dart';
import 'package:rxdart/rxdart.dart';

import '../../rest/resultado_state.dart';

class HomeBloc {
  final GetCharactersUseCase _getCharactersUseCase;

  HomeBloc(
    this._getCharactersUseCase,
  );

  final _charactersController = BehaviorSubject<ResultadoState>();

  Stream<ResultadoState> get charactersStream => _charactersController.stream;

  Function(ResultadoState) get charactersSink => _charactersController.sink.add;

  void getCharacters() async {
    charactersSink(ResultadoState.loading());
    ResultadoState result = await _getCharactersUseCase.execute();
    charactersSink(result);
  }

  void dispose() {
    _charactersController.close();
  }

}
