import 'package:flutter/cupertino.dart' hide OverlayVisibilityMode;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iptv_player/home/provider/search_value_provider.dart';
import 'package:iptv_player/home/widgets/movie_list_item.dart';
import 'package:iptv_player/provider/isar/iptv_server_provider.dart';
import 'package:iptv_player/provider/isar/m3u_provider.dart';
import 'package:iptv_player/service/collections/item_category.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../theme.dart';

class ChannelsPage extends ConsumerStatefulWidget {
  const ChannelsPage({super.key});

  @override
  ConsumerState<ChannelsPage> createState() => _ChannelsPageState();
}

class _ChannelsPageState extends ConsumerState<ChannelsPage> {
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
            .read(channelSearchValueProvider.notifier)
            .setValue(searchController.value.text),
      );
  }

  @override
  Widget build(BuildContext context) {
    final channelProvider = ref.watch(
      findAllChannelsProvider(category: _category),
    );
    final currentTheme = ref.watch(appThemeProvider);
    return MacosScaffold(
      toolBar: ToolBar(
        decoration: BoxDecoration(color: MacosTheme.of(context).canvasColor),
        leading: MacosIconButton(
          icon: const MacosIcon(
            CupertinoIcons.sidebar_left,
          ),
          onPressed: () => MacosWindowScope.of(context).toggleSidebar(),
        ),
        title: const Text('Channels'),
        actions: [
          ToolBarIconButton(
            label: currentTheme == ThemeMode.light ? "Dark Mode" : "Light Mode",
            icon: const MacosIcon(
              CupertinoIcons.color_filter,
            ),
            onPressed: () =>
                ref.read(appThemeProvider.notifier).setAndPersistThemeMode(
                      currentTheme == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light,
                    ),
            showLabel: true,
          ),
        ],
      ),
      children: [
        ContentArea(
          builder: (context, scrollController) {
            final isUpdating = ref.watch(isUpdatingActiveIptvServerProvider);

            if (!isUpdating) {
              return MacosWindow(
                sidebar: Sidebar(
                  decoration:
                      BoxDecoration(color: MacosTheme.of(context).canvasColor),
                  dragClosed: false,
                  minWidth: 200,
                  maxWidth: 200,
                  topOffset: 0,
                  top: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Categories"),
                  ),
                  builder: (context, scrollController) {
                    return ref.watch(findAllChannelGroupsProvider).when(
                          data: (data) => SidebarItems(
                            scrollController: scrollController,
                            currentIndex: _pageIndex,
                            onChanged: (index) {
                              setState(() {
                                if (index - 1 >= 0) {
                                  _category = data[index - 1];
                                } else {
                                  _category = null;
                                }
                                _pageIndex = index;
                              });
                            },
                            items: [
                              const SidebarItem(
                                label: Text("All"),
                              ),
                              for (var item in data)
                                SidebarItem(
                                  label: Flexible(
                                    child: Text("${item.categoryName}"),
                                  ),
                                )
                            ],
                          ),
                          error: (error, stackTrace) => Container(),
                          loading: () => Container(),
                        );
                  },
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MacosTextField(
                              controller: searchController,
                              prefix: const MacosIcon(CupertinoIcons.search),
                              placeholder: 'Search for a channel',
                              clearButtonMode: OverlayVisibilityMode.editing,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: channelProvider.when(
                        data: (channels) {
                          if (channels.isNotEmpty) {
                            var size = MediaQuery.of(context).size;
                            final double itemHeight = (size.height) / 1.25;
                            final double itemWidth = size.width / 2;
                            return GridView.builder(
                              controller: scrollController,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    calculateCrossAxisCount(context),
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: (itemWidth / itemHeight),
                              ),
                              itemBuilder: (_, index) => M3uListItem(
                                channelViewModel: channels[index],
                                height: itemHeight,
                              ),
                              itemCount: channels.length,
                              padding: const EdgeInsets.all(10),
                            );
                          } else {
                            return const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("No channels found"),
                                ],
                              ),
                            );
                          }
                        },
                        error: (error, _) => Container(),
                        loading: () => const Center(
                          child: ProgressCircle(),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Downloading and reading playlist..."),
                    ProgressCircle(),
                  ],
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
