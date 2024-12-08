import 'package:flutter/cupertino.dart' hide OverlayVisibilityMode;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_shift/home/provider/search_value_provider.dart';
import 'package:play_shift/home/widgets/grid_layout_widget.dart';
import 'package:play_shift/home/widgets/movie_list_item.dart';
import 'package:play_shift/provider/isar/channel_providers.dart';
import 'package:play_shift/router/app_router.gr.dart';
import 'package:play_shift/service/collections/item_category.dart';

class ChannelsPage extends ConsumerStatefulWidget {
  const ChannelsPage({super.key});

  @override
  ConsumerState<ChannelsPage> createState() => _ChannelsPageState();
}

class _ChannelsPageState extends ConsumerState<ChannelsPage> {
  late TextEditingController searchController;
  ItemCategory? _category;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController()
      ..addListener(
        () => ref
            .read(channelSearchValueProvider.notifier)
            .setValue(searchController.value.text),
      );
  }

  @override
  Widget build(BuildContext context) {
    final channelProvider = ref.watch(
      findAllChannelsProvider(category: _category),
    );
    final categories = ref.watch(findAllChannelGroupsProvider);

    return GridLayoutWidget(
      title: 'Channels',
      channelProvider: channelProvider,
      categories: categories,
      placeHolderForSearchField: 'Search for a channel',
      height: 1.6,
      width: 2,
      errorText: 'No channels found',
      onCategoryChanged: (ItemCategory? category) {
        setState(() {
          _category = category;
        });
      },
      searchController: searchController,
      itemBuilder: (context, itemHeight, item) => AspectRatio(
        aspectRatio: 1,
        child: M3uListItem(
          channelViewModel: item,
          height: itemHeight,
          route: ChannelOverviewRoute(streamId: item.streamId),
          titleMaxLines: 1,
        ),
      ),
    );
  }
}
