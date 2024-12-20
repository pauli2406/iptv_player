import 'package:flutter/cupertino.dart' hide OverlayVisibilityMode;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_shift/home/provider/search_value_provider.dart';
import 'package:play_shift/home/widgets/grid_layout_widget.dart';
import 'package:play_shift/home/widgets/series_list_item.dart';
import 'package:play_shift/provider/isar/series_providers.dart';
import 'package:play_shift/service/collections/item_category.dart';

class SeriesPage extends ConsumerStatefulWidget {
  const SeriesPage({super.key});

  @override
  ConsumerState<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends ConsumerState<SeriesPage> {
  late TextEditingController searchController;
  ItemCategory? _category;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController()
      ..addListener(
        () => ref
            .read(seriesSearchValueProvider.notifier)
            .setValue(searchController.value.text),
      );
  }

  @override
  Widget build(BuildContext context) {
    final seriesProvider =
        ref.watch(findAllSeriesProvider(category: _category));
    final categories = ref.watch(findAllSeriesGroupsProvider);
    return GridLayoutWidget(
      title: 'Series',
      channelProvider: seriesProvider,
      categories: categories,
      placeHolderForSearchField: 'Search for a series',
      height: 1,
      width: 2,
      errorText: 'No series found',
      onCategoryChanged: (ItemCategory? category) {
        setState(() {
          _category = category;
        });
      },
      searchController: searchController,
      itemBuilder: (context, itemHeight, item) => SeriesListItem(
        item,
        height: itemHeight,
      ),
    );
  }
}
