import 'package:flutter/material.dart';
import 'package:reto_tecnico/src/model/event_response.dart';
import 'package:reto_tecnico/src/model/series_response.dart';
import 'package:reto_tecnico/src/pages/detail/detail_character_bloc.dart';
import 'package:reto_tecnico/src/pages/detail/widget/item_detail.dart';
import 'package:reto_tecnico/src/widget/custom_progress.dart';

import '../../../base/bloc_provider.dart';
import '../../../rest/base_custom_response.dart';
import '../../../rest/base_response_list.dart';
import '../../../rest/resultado_state.dart';

class SeriesWidget extends StatelessWidget {
  SeriesWidget({Key? key}) : super(key: key);
  DetailCharacterBloc? _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc ??= BlocProvider.of(context);
    return StreamBuilder<ResultadoState>(
      stream: _bloc?.seriesStream,
      builder: (BuildContext context, AsyncSnapshot<ResultadoState> snapshot) {
        if (snapshot.hasData) {
          var value = snapshot.data;
          if (value is LoadedResultadoState) {
            final response = BaseCustomResponse.fromJson(value.result);
            final listOfSeries = BaseResponseList.fromJson(value.result["data"],
                (json) => SeriesResponse.fromJson(json)).data;
            return _buildPageView(listOfSeries);
          } else if (value is LoadingResultadoState) {
            return const CustomProgress();
          } else {
            return const SizedBox();
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _buildPageView(List<SeriesResponse> series) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: series.length,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemBuilder: (context, index) {
          final event = series[index];
          return ItemDetail(
              title: event.title,
              director: "",
              imageUrl: getImageFromCharacter(event));
        });
  }

  String getImageFromCharacter(SeriesResponse serie) {
    final thumbnail = serie.thumbnail;
    final path = thumbnail?.path ?? "";
    final extension = thumbnail?.extension ?? "";
    return "$path.$extension";
  }
}
