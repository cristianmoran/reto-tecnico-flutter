import 'package:flutter/material.dart';
import 'package:reto_tecnico/src/utils/constants.dart';
import 'package:reto_tecnico/src/widget/custom_progress.dart';

import '../../../base/bloc_provider.dart';
import '../../../model/character_response.dart';
import '../../../rest/base_custom_response.dart';
import '../../../rest/base_response_list.dart';
import '../../../rest/resultado_state.dart';
import '../home_bloc.dart';

class PageViewCharacter extends StatefulWidget {
  const PageViewCharacter({Key? key}) : super(key: key);

  @override
  State<PageViewCharacter> createState() => _PageViewCharacterState();
}

class _PageViewCharacterState extends State<PageViewCharacter> {
  int _currentIndex = 0;
  HomeBloc? _bloc;

  final _pageViewController =
      PageController(initialPage: 0, viewportFraction: 0.75);

  @override
  Widget build(BuildContext context) {
    _bloc ??= BlocProvider.of(context);
    return StreamBuilder<ResultadoState>(
      stream: _bloc?.charactersStream,
      builder: (BuildContext context, AsyncSnapshot<ResultadoState> snapshot) {
        if (snapshot.hasData) {
          var value = snapshot.data;
          if (value is LoadedResultadoState) {
            final response = BaseCustomResponse.fromJson(value.result);
            final listOfCharacters = BaseResponseList.fromJson(
                value.result["data"],
                (json) => CharacterResponse.fromJson(json)).data;
            return _buildPageView(listOfCharacters);
          } else if (value is LoadingResultadoState) {
            return const CustomProgress();
          } else {
            return const Placeholder();
          }
        } else {
          return const Placeholder();
        }
      },
    );
  }

  Widget _buildPageView(List<CharacterResponse> characters) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        height: size.height * 0.75,
        child: PageView.builder(
            controller: _pageViewController,
            itemCount: characters.length,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final character = characters[index];
              final images = getImageFromCharacter(character);
              var _scale = _currentIndex == index ? 1.0 : 0.8;
              return TweenAnimationBuilder(
                  tween: Tween(begin: _scale, end: _scale),
                  duration: const Duration(milliseconds: 350),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, routeDetail,
                        arguments: character),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage(images), fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  builder: (context, double value, child) {
                    return Transform.scale(scale: value, child: child);
                  });
            }),
      ),
    );
  }

  String getImageFromCharacter(CharacterResponse character) {
    final thumbnail = character.thumbnail;
    final path = thumbnail?.path ?? "";
    final extension = thumbnail?.extension ?? "";
    return "$path.$extension";
  }

  @override
  void dispose() {
    _bloc?.dispose();
    super.dispose();
  }
}
