import 'package:flutter/cupertino.dart' hide OverlayVisibilityMode;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iptv_player/home/provider/search_value_provider.dart';
import 'package:iptv_player/home/widgets/grid_layout_widget.dart';
import 'package:iptv_player/provider/isar/iptv_server_provider.dart';
import 'package:iptv_player/provider/isar/m3u_provider.dart';
import 'package:iptv_player/service/collections/item_category.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../theme.dart';

class MoviesPage extends ConsumerStatefulWidget {
  const MoviesPage({super.key});

  @override
  ConsumerState<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends ConsumerState<MoviesPage> {
  late TextEditingController searchController;
  int _pageIndex = 0;
  ItemCategory? _category;

  int calculateCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1500) {
      return 5;
    } else if (width > 1000) {
      return 4;
    } else if (width > 700) {
      return 3;
    } else {
      return 2;
    }
  }

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController()
      ..addListener(
        () => ref
            .read(movieSearchValueProvider.notifier)
            .setValue(searchController.value.text),
      );
  }

  @override
  Widget build(BuildContext context) {
    final movieProvider = ref.watch(findAllMoviesProvider(category: _category));
    final categories = ref.watch(findAllMovieGroupsProvider);

    return ReusableWidget(
      title: 'Movies',
      channelProvider: movieProvider,
      categories: categories,
      placeHolderForSearchField: 'Search for a movie',
      height: 1.75,
      width: 2,
      errorText: 'No movies found',
      route: "/main/movie/player",
      onCategoryChanged: (ItemCategory? category) {
        setState(() {
          _category = category;
        });
      },
      searchController: searchController,
    );
  }
}
