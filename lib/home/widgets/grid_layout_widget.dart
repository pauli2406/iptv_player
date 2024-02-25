import 'package:flutter/cupertino.dart' hide OverlayVisibilityMode;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iptv_player/home/widgets/movie_list_item.dart';
import 'package:iptv_player/provider/isar/iptv_server_provider.dart';
import 'package:iptv_player/service/collections/item_category.dart';
import 'package:iptv_player/theme.dart';
import 'package:macos_ui/macos_ui.dart';

class ReusableWidget extends ConsumerStatefulWidget {
  final String title;
  final AsyncValue<List> channelProvider;
  final AsyncValue<List<ItemCategory>> categories;
  final String placeHolderForSearchField;
  final double height;
  final double width;
  final TextEditingController searchController;
  final String route;

  final String errorText;
  final Function(ItemCategory?) onCategoryChanged;

  ReusableWidget({
    required this.title,
    required this.channelProvider,
    required this.categories,
    required this.placeHolderForSearchField,
    required this.height,
    required this.width,
    required this.errorText,
    required this.onCategoryChanged,
    required this.searchController,
    required this.route,
  });

  @override
  ConsumerState<ReusableWidget> createState() => _ReusableWidgetState();
}

class _ReusableWidgetState extends ConsumerState<ReusableWidget> {
  late TextEditingController searchController;
  int _pageIndex = 0;

  int calculateCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1500) {
      return 5;
    } else if (width > 1100) {
      return 4;
    } else if (width > 800) {
      return 3;
    } else {
      return 2;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        title: Text(widget.title),
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
                    return widget.categories.when(
                      data: (data) => SidebarItems(
                        scrollController: scrollController,
                        currentIndex: _pageIndex,
                        onChanged: (index) {
                          setState(() {
                            if (index - 1 >= 0) {
                              widget.onCategoryChanged(data[index - 1]);
                            } else {
                              widget.onCategoryChanged(null);
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
                              controller: widget.searchController,
                              prefix: const MacosIcon(CupertinoIcons.search),
                              placeholder: widget.placeHolderForSearchField,
                              clearButtonMode: OverlayVisibilityMode.editing,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: widget.channelProvider.when(
                        data: (channels) {
                          if (channels.isNotEmpty) {
                            var size = MediaQuery.of(context).size;
                            final double itemWidth =
                                (size.height) / widget.width;
                            final double itemHeight =
                                (size.height) / widget.height;
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
                                route: widget.route,
                              ),
                              itemCount: channels.length,
                              padding: const EdgeInsets.all(10),
                            );
                          } else {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(widget.errorText),
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
