import 'package:flutter/cupertino.dart' hide OverlayVisibilityMode;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iptv_player/home/provider/search_value_provider.dart';
import 'package:iptv_player/home/widgets/grid_layout_widget.dart';
import 'package:iptv_player/home/widgets/movie_list_item.dart';
import 'package:iptv_player/provider/isar/m3u_provider.dart';
import 'package:iptv_player/router/app_router.gr.dart';
import 'package:iptv_player/service/collections/item_category.dart';

class MoviesPage extends ConsumerStatefulWidget {
  const MoviesPage({super.key});

  @override
  ConsumerState<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends ConsumerState<MoviesPage> {
  late TextEditingController searchController;
  ItemCategory? _category;

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

    return GridLayoutWidget(
      title: 'Movies',
      channelProvider: movieProvider,
      categories: categories,
      placeHolderForSearchField: 'Search for a movie',
      height: 1.5,
      width: 2,
      errorText: 'No movies found',
      onCategoryChanged: (ItemCategory? category) {
        setState(() {
          _category = category;
        });
      },
      searchController: searchController,
      itemBuilder: (context, itemHeight, item) => M3uListItem(
        channelViewModel: item,
        height: itemHeight,
        route: VodVideoPlayerRoute(streamId: item.streamId),
      ),
    );
  }
}
