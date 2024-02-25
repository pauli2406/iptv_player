import 'package:flutter/cupertino.dart' hide OverlayVisibilityMode;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iptv_player/home/provider/search_value_provider.dart';
import 'package:iptv_player/home/widgets/grid_layout_widget.dart';
import 'package:iptv_player/provider/isar/m3u_provider.dart';
import 'package:iptv_player/service/collections/item_category.dart';

class ChannelsPage extends ConsumerStatefulWidget {
  const ChannelsPage({super.key});

  @override
  ConsumerState<ChannelsPage> createState() => _ChannelsPageState();
}

class _ChannelsPageState extends ConsumerState<ChannelsPage> {
  late TextEditingController searchController;
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
    return ReusableWidget(
      title: 'Channels',
      channelProvider: channelProvider,
      categories: categories,
      placeHolderForSearchField: 'Search for a channel',
      height: 1.75,
      width: 2,
      errorText: 'No channels found',
      route: "/main/channel/player",
      onCategoryChanged: (ItemCategory? category) {
        setState(() {
          _category = category;
        });
      },
      searchController: searchController,
    );
  }
}
