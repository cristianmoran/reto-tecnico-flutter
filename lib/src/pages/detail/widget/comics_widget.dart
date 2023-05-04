import 'package:flutter/material.dart';
import 'package:reto_tecnico/src/model/comic_response.dart';
import 'package:reto_tecnico/src/pages/detail/detail_character_bloc.dart';
import 'package:reto_tecnico/src/pages/detail/widget/item_detail.dart';
import 'package:reto_tecnico/src/widget/custom_progress.dart';

import '../../../base/bloc_provider.dart';
import '../../../rest/base_custom_response.dart';
import '../../../rest/base_response_list.dart';
import '../../../rest/resultado_state.dart';

class ComicsWidget extends StatelessWidget {
  ComicsWidget({Key? key}) : super(key: key);
  DetailCharacterBloc? _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc ??= BlocProvider.of(context);
    return StreamBuilder<ResultadoState>(
      stream: _bloc?.comicsStream,
      builder: (BuildContext context, AsyncSnapshot<ResultadoState> snapshot) {
        if (snapshot.hasData) {
          var value = snapshot.data;
          if (value is LoadedResultadoState) {
            final response = BaseCustomResponse.fromJson(value.result);
            final listOfComics = BaseResponseList.fromJson(value.result["data"],
                (json) => ComicResponse.fromJson(json)).data;
            return _buildPageView(listOfComics);
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

  Widget _buildPageView(List<ComicResponse> comics) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: comics.length,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemBuilder: (context, index) {
          final comic = comics[index];
          return ItemDetail(
              title: comic.title,
              director: "",
              imageUrl: getImageFromCharacter(comic));
        });
  }

  String getImageFromCharacter(ComicResponse comic) {
    final thumbnail = comic.thumbnail;
    final path = thumbnail?.path ?? "";
    final extension = thumbnail?.extension ?? "";
    return "$path.$extension";
  }
}
