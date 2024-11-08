import 'package:auto_route/auto_route.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iptv_player/home/provider/search_value_provider.dart';
import 'package:iptv_player/home/widgets/grid_layout_widget.dart';
import 'package:iptv_player/home/widgets/movie_list_item.dart';
import 'package:iptv_player/provider/isar/m3u_provider.dart';
import 'package:iptv_player/router/app_router.gr.dart';
import 'package:iptv_player/service/collections/item_category.dart';
import 'package:platform_builder/platform_builder.dart';

@RoutePage()
class SeriesSeasonPage extends ConsumerStatefulWidget {
  const SeriesSeasonPage({required this.seriesId, super.key});

  final int seriesId;

  @override
  ConsumerState<SeriesSeasonPage> createState() => _SeriesSeasonPage();
}

class _SeriesSeasonPage extends ConsumerState<SeriesSeasonPage> {
  ItemCategory? _category;

  late TextEditingController searchController;

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
        ref.watch(findSeriesProvider(seriesId: widget.seriesId));
    final seriesInfo =
        ref.watch(findSeriesInfoProvider(seriesId: widget.seriesId)).value;
    final seasons = seriesInfo?.seasons?.toList() ?? [];
    seasons.sort((a, b) => a.seasonNumber!.compareTo(b.seasonNumber!));
    final categories = AsyncValue.data(
      seasons
          .map(
            (e) => ItemCategory(
              e.seasonNumber!,
              e.name,
              e.seasonNumber,
              ItemCategoryType.series,
            ),
          )
          .toList(),
    );

    final seriesItemProvider = ref.watch(
      findAllSeriesEpisodesProvider(
          seriesId: widget.seriesId, season: _category),
    );
    final series = seriesProvider.value;

    return PlatformBuilder(
      macOSBuilder: (context) => GridLayoutWidget(
        title: series?.name ?? 'Series',
        channelProvider: seriesItemProvider,
        categories: categories,
        placeHolderForSearchField: 'Search for an episode',
        height: 1.5,
        width: 2,
        errorText: 'No episode found',
        onCategoryChanged: (ItemCategory? category) {
          setState(() {
            _category = category;
          });
        },
        searchController: searchController,
        itemBuilder: (context, itemHeight, item) => M3uListItem(
          channelViewModel: item,
          height: itemHeight,
          route: SeriesVideoPlayerRoute(
            streamId: item.streamId,
            streamUrl: item.link,
            streamTitle: item.title,
            streamCover: item.logoUrl,
          ),
        ),
        showBackButton: true,
      ),
      windowsBuilder: (context) => NavigationView(
        appBar: const NavigationAppBar(automaticallyImplyLeading: false),
        content: ScaffoldPage.withPadding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          header: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                  icon: const Icon(FluentIcons.back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Expanded(
                child: PageHeader(
                    title: Text(series?.name ?? 'This is a header text')),
              ),
            ],
          ),
          content: GridLayoutWidget(
            title: series?.name ?? 'Series',
            channelProvider: seriesItemProvider,
            categories: categories,
            placeHolderForSearchField: 'Search for an episode',
            height: 1.5,
            width: 2,
            errorText: 'No episode found',
            onCategoryChanged: (ItemCategory? category) {
              setState(() {
                _category = category;
              });
            },
            searchController: searchController,
            itemBuilder: (context, itemHeight, item) => M3uListItem(
              channelViewModel: item,
              height: itemHeight,
              route: SeriesVideoPlayerRoute(
                streamId: item.streamId,
                streamUrl: item.link,
                streamTitle: item.title,
                streamCover: item.logoUrl,
              ),
            ),
            showBackButton: true,
          ),
        ),
      ),
      iOSBuilder: (context) => GridLayoutWidget(
        title: series?.name ?? 'Series',
        channelProvider: seriesItemProvider,
        categories: categories,
        placeHolderForSearchField: 'Search for an episode',
        height: 1.5,
        width: 2,
        errorText: 'No episode found',
        onCategoryChanged: (ItemCategory? category) {
          setState(() {
            _category = category;
          });
        },
        searchController: searchController,
        itemBuilder: (context, itemHeight, item) => M3uListItem(
          channelViewModel: item,
          height: itemHeight,
          route: SeriesVideoPlayerRoute(
            streamId: item.streamId,
            streamUrl: item.link,
            streamTitle: item.title,
            streamCover: item.logoUrl,
          ),
        ),
        showBackButton: true,
      ),
    );
  }
}
