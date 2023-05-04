import 'package:flutter/material.dart';
import 'package:reto_tecnico/src/model/stories_response.dart';
import 'package:reto_tecnico/src/pages/detail/detail_character_bloc.dart';
import 'package:reto_tecnico/src/pages/detail/widget/item_detail.dart';
import 'package:reto_tecnico/src/widget/custom_progress.dart';

import '../../../base/bloc_provider.dart';
import '../../../rest/base_custom_response.dart';
import '../../../rest/base_response_list.dart';
import '../../../rest/resultado_state.dart';

class StoriesWidget extends StatelessWidget {
  StoriesWidget({Key? key}) : super(key: key);
  DetailCharacterBloc? _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc ??= BlocProvider.of(context);
    return StreamBuilder<ResultadoState>(
      stream: _bloc?.storiesStream,
      builder: (BuildContext context, AsyncSnapshot<ResultadoState> snapshot) {
        if (snapshot.hasData) {
          var value = snapshot.data;
          if (value is LoadedResultadoState) {
            final response = BaseCustomResponse.fromJson(value.result);
            final listOfStories = BaseResponseList.fromJson(
                value.result["data"],
                (json) => StoriesResponse.fromJson(json)).data;
            return _buildPageView(listOfStories);
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

  Widget _buildPageView(List<StoriesResponse> stories) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: stories.length,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemBuilder: (context, index) {
          final storie = stories[index];
          return ItemDetail(
              title: storie.title,
              director: "",
              imageUrl: getImageFromCharacter(storie));
        });
  }

  String getImageFromCharacter(StoriesResponse storie) {
    final thumbnail = storie.thumbnail;
    final path = thumbnail?.path ?? "";
    final extension = thumbnail?.extension ?? "";
    return "$path.$extension";
  }
}
