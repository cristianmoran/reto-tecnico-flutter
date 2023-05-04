import 'package:flutter/material.dart';
import 'package:reto_tecnico/src/model/event_response.dart';
import 'package:reto_tecnico/src/pages/detail/detail_character_bloc.dart';
import 'package:reto_tecnico/src/pages/detail/widget/item_detail.dart';
import 'package:reto_tecnico/src/widget/custom_progress.dart';

import '../../../base/bloc_provider.dart';
import '../../../rest/base_custom_response.dart';
import '../../../rest/base_response_list.dart';
import '../../../rest/resultado_state.dart';

class EventsWidget extends StatelessWidget {
  EventsWidget({Key? key}) : super(key: key);
  DetailCharacterBloc? _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc ??= BlocProvider.of(context);
    return StreamBuilder<ResultadoState>(
      stream: _bloc?.eventsStream,
      builder: (BuildContext context, AsyncSnapshot<ResultadoState> snapshot) {
        if (snapshot.hasData) {
          var value = snapshot.data;
          if (value is LoadedResultadoState) {
            final response = BaseCustomResponse.fromJson(value.result);
            final listOfEvents = BaseResponseList.fromJson(value.result["data"],
                (json) => EventResponse.fromJson(json)).data;
            return _buildPageView(listOfEvents);
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

  Widget _buildPageView(List<EventResponse> events) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: events.length,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemBuilder: (context, index) {
          final event = events[index];
          return ItemDetail(
              title: event.title,
              director: "",
              imageUrl: getImageFromCharacter(event));
        });
  }

  String getImageFromCharacter(EventResponse event) {
    final thumbnail = event.thumbnail;
    final path = thumbnail?.path ?? "";
    final extension = thumbnail?.extension ?? "";
    return "$path.$extension";
  }
}
