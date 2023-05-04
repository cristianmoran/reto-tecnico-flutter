import 'package:flutter/material.dart';
import 'package:reto_tecnico/src/pages/detail/detail_character_bloc.dart';
import 'package:reto_tecnico/src/pages/detail/widget/events_widget.dart';
import 'package:reto_tecnico/src/pages/detail/widget/series_widget.dart';
import 'package:reto_tecnico/src/pages/detail/widget/stories_widget.dart';

import '../../base/bloc_provider.dart';
import '../../model/character_response.dart';
import '../../utils/constants.dart';
import 'widget/comics_widget.dart';

class DetailCharacterPage extends StatelessWidget {
  DetailCharacterBloc? _bloc;
  List<Tab> tabs = <Tab>[
    const Tab(text: tabComics),
    const Tab(text: tabEvents),
    const Tab(text: tabSeries),
    const Tab(text: tabStories)
  ];

  @override
  Widget build(BuildContext context) {
    _bloc ??= BlocProvider.of(context);
    final character =
        ModalRoute.of(context)?.settings.arguments as CharacterResponse;

    _bloc?.characterId = character.id.toString();
    _bloc?.getComics();

    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        TabController? tabController = DefaultTabController.of(context);
        tabController?.addListener(() {
          if (!tabController.indexIsChanging) {
            if (tabController.index == 0) {
              _bloc?.getComics();
            } else if (tabController.index == 1) {
              _bloc?.getEvents();
            } else if (tabController.index == 2) {
              _bloc?.getSeries();
            } else {
              _bloc?.getStories();
            }
          }
        });
        return Scaffold(
          appBar: AppBar(
            title: const Text("Characters"),
            bottom: TabBar(tabs: tabs),
          ),
          body: TabBarView(
            children: tabs.map((Tab tab) {
              return getScreen(tab.text ?? "");
            }).toList(),
          ),
        );
      }),
    );
  }

  Widget getScreen(String tab) {
    if (tab == tabComics) {
      return ComicsWidget();
    } else if (tab == tabEvents) {
      return EventsWidget();
    } else if (tab == tabSeries) {
      return SeriesWidget();
    } else
      return StoriesWidget();
  }
}
