import 'package:get_it/get_it.dart';
import 'package:reto_tecnico/src/pages/detail/detail_character_bloc.dart';
import 'package:reto_tecnico/src/datasources/remote/characters_remote.dart';
import 'package:reto_tecnico/src/usecase/get_characters_usecase.dart';
import 'package:reto_tecnico/src/usecase/get_comics_of_character_usecase.dart';
import 'package:reto_tecnico/src/usecase/get_events_of_character_usecase.dart';
import 'package:reto_tecnico/src/usecase/get_series_of_character_usecase.dart';
import 'package:reto_tecnico/src/usecase/get_stories_of_character_usecase.dart';

import '../pages/home/home_bloc.dart';

final getIt = GetIt.instance;

void init() {
  registerRemotes();
  registerUseCase();
  registerBloc();
}

void registerRemotes() {
  getIt.registerLazySingleton(() => CharactersRemote());
}

void registerUseCase() {
  getIt.registerLazySingleton(() => GetCharactersUseCase(getIt()));
  getIt.registerLazySingleton(() => GetComicsOfCharacterUseCase(getIt()));
  getIt.registerLazySingleton(() => GetEventsOfCharacterUseCase(getIt()));
  getIt.registerLazySingleton(() => GetSeriesOfCharacterUseCase(getIt()));
  getIt.registerLazySingleton(() => GetStoriesOfCharacterUseCase(getIt()));
}

void registerBloc() {
  getIt.registerFactory(() => HomeBloc(getIt()));
  getIt.registerFactory(
      () => DetailCharacterBloc(getIt(), getIt(), getIt(), getIt()));
}
