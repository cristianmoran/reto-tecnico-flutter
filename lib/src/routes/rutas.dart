import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reto_tecnico/src/pages/detail/detail_character_bloc.dart';
import 'package:reto_tecnico/src/pages/detail/detail_character_page.dart';

import '../base/bloc_provider.dart';
import '../pages/home/home_bloc.dart';
import '../di/dependencies_provider.dart';
import '../pages/home/home_page.dart';
import '../utils/constants.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    routeHome: (_) => BlocProvider(bloc: getIt<HomeBloc>(), child: HomePage()),
    routeDetail: (_) => BlocProvider(bloc: getIt<DetailCharacterBloc>(), child: DetailCharacterPage()),
  };
}
