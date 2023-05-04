import 'package:flutter/material.dart';

import '../../base/bloc_provider.dart';
import 'home_bloc.dart';
import 'widget/pageview_character.dart';

class HomePage extends StatelessWidget {
  HomeBloc? _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc ??= BlocProvider.of(context);
    _bloc?.getCharacters();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("Characters")),
      body: const PageViewCharacter(),
    );
  }

}
