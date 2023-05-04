import 'package:reto_tecnico/src/usecase/get_comics_of_character_usecase.dart';
import 'package:reto_tecnico/src/usecase/get_events_of_character_usecase.dart';
import 'package:rxdart/rxdart.dart';

import '../../rest/resultado_state.dart';
import '../../usecase/get_series_of_character_usecase.dart';
import '../../usecase/get_stories_of_character_usecase.dart';

class DetailCharacterBloc {
  final GetComicsOfCharacterUseCase _getComicsOfCharacterUseCase;
  final GetEventsOfCharacterUseCase _getEventsOfCharacterUseCase;
  final GetSeriesOfCharacterUseCase _getSeriesOfCharacterUseCase;
  final GetStoriesOfCharacterUseCase _getStoriesOfCharacterUseCase;

  String characterId = "";

  DetailCharacterBloc(
      this._getComicsOfCharacterUseCase,
      this._getEventsOfCharacterUseCase,
      this._getSeriesOfCharacterUseCase,
      this._getStoriesOfCharacterUseCase);

  final _comicsController = BehaviorSubject<ResultadoState>();
  final _eventsController = BehaviorSubject<ResultadoState>();
  final _seriesController = BehaviorSubject<ResultadoState>();
  final _storiesController = BehaviorSubject<ResultadoState>();

  Stream<ResultadoState> get comicsStream => _comicsController.stream;

  Stream<ResultadoState> get eventsStream => _eventsController.stream;

  Stream<ResultadoState> get seriesStream => _seriesController.stream;

  Stream<ResultadoState> get storiesStream => _storiesController.stream;

  Function(ResultadoState) get comicsSink => _comicsController.sink.add;

  Function(ResultadoState) get eventsSink => _eventsController.sink.add;

  Function(ResultadoState) get seriesSink => _seriesController.sink.add;

  Function(ResultadoState) get storiesSink => _storiesController.sink.add;

  void getComics() async {
    comicsSink(ResultadoState.loading());
    ResultadoState result =
        await _getComicsOfCharacterUseCase.execute(characterId);
    comicsSink(result);
  }

  void getEvents() async {
    eventsSink(ResultadoState.loading());
    ResultadoState result =
        await _getEventsOfCharacterUseCase.execute(characterId);
    eventsSink(result);
  }

  void getSeries() async {
    seriesSink(ResultadoState.loading());
    ResultadoState result =
        await _getSeriesOfCharacterUseCase.execute(characterId);
    seriesSink(result);
  }

  void getStories() async {
    storiesSink(ResultadoState.loading());
    ResultadoState result =
        await _getStoriesOfCharacterUseCase.execute(characterId);
    storiesSink(result);
  }

  void dispose() {
    _comicsController.close();
    _eventsController.close();
    _seriesController.close();
    _storiesController.close();
  }
}
