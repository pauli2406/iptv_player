// import 'package:flutter/cupertino.dart' hide OverlayVisibilityMode;
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:iptv_player/home/widgets/grid_layout_widget.dart';
// import 'package:iptv_player/provider/isar/iptv_server_provider.dart';
// import 'package:iptv_player/provider/isar/m3u_provider.dart';
// import 'package:iptv_player/service/collections/item_category.dart';
// import 'package:macos_ui/macos_ui.dart';

// import '../../widgets/movie_list_item.dart';

// class SeriesItemPage extends ConsumerStatefulWidget {
//   const SeriesItemPage({
//     required this.seriesId,
//     required this.seasonId,
//     super.key,
//   });

//   final int seriesId;
//   final int seasonId;

//   @override 
//   ConsumerState<SeriesItemPage> createState() => _SeriesItemPageState();
// }

// class _SeriesItemPageState extends ConsumerState<SeriesItemPage> {
//   late TextEditingController searchController;
//   ItemCategory? _category;

//   int calculateCrossAxisCount(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     if (width > 1500) {
//       return 5;
//     } else if (width > 1000) {
//       return 4;
//     } else if (width > 700) {
//       return 3;
//     } else {
//       return 2;
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final seriesProvider = ref.watch(findSeriesProvider(
//       streamId: widget.seriesId,
//     ));

//     // seriesProvider.when(
//     //   data: (series) {
//     //     final season = series.seasons.firstWhere(
//     //       (element) => element!.id == widget.seasonId,
//     //       orElse: () => null,
//     //     );
//     //     if (season != null) {
//     //       ref.read(findAllMoviesProvider(category: null));
//     //     }
//     //   },
//     //   loading: () {},
//     //   error: (error, stack) {},
//     // );

//     // GridLayoutWidget(
//     //   title: seriesProvider.value?.title ?? "",
//     //   channelProvider:,
//     //   categories: categories,
//     //   placeHolderForSearchField: 'Search for a movie',
//     //   height: 1.5,
//     //   width: 2,
//     //   errorText: 'No movies found',
//     //   onCategoryChanged: (ItemCategory? category) {
//     //     setState(() {
//     //       _category = category;
//     //     });
//     //   },
//     //   searchController: searchController,
//     //   itemBuilder: (context, itemHeight, item) => M3uListItem(
//     //     channelViewModel: item,
//     //     height: itemHeight,
//     //     route: "/main/movie/player",
//     //   ),
//     // );

//     return MacosScaffold(
//       toolBar: ToolBar(
//         decoration: BoxDecoration(color: MacosTheme.of(context).canvasColor),
//         title: Text(seriesProvider.value?.title ?? ""),
//       ),
//       children: [
//         ContentArea(
//           builder: (context, scrollController) {
//             final isUpdating = ref.watch(isUpdatingActiveIptvServerProvider);
//             if (!isUpdating) {
//               return Container(
//                 decoration:
//                     BoxDecoration(color: MacosTheme.of(context).canvasColor),
//                 child: seriesProvider.map(
//                   data: (seriesObj) {
//                     final series = seriesObj.value;
//                     var size = MediaQuery.of(context).size;
//                     final double itemHeight = (size.height) / 1.5;
//                     final double itemWidth = size.width / 2;
//                     return GridView.builder(
//                       controller: scrollController,
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: calculateCrossAxisCount(context),
//                         crossAxisSpacing: 10,
//                         mainAxisSpacing: 10,
//                         childAspectRatio: (itemWidth / itemHeight),
//                       ),
//                       itemBuilder: (_, index) => M3uListItem(
//                         link: series[index].link,
//                         title: series[index].title ?? "",
//                         logoUrl: series[index].cover ?? "",
//                         isLive: series[index].streamType == "live",
//                         height: itemHeight,
//                       ),
//                       itemCount: movies.length,
//                       padding: const EdgeInsets.all(10),
//                     );
//                   },
//                   error: (error) => Container(),
//                   loading: (_) => const Center(
//                     child: ProgressCircle(),
//                   ),
//                 ),
//               );
//             } else {
//               return const Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Downloading and reading playlist..."),
//                     ProgressCircle(),
//                   ],
//                 ),
//               );
//             }
//           },
//         ),
//       ],
//     );
//   }
// }
