import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_shift/provider/isar/iptv_server_provider.dart';
import 'package:play_shift/service/collections/item_category.dart';
import 'package:play_shift/widgets/loading_indicator.dart';

class GridLayoutWidget extends ConsumerStatefulWidget {
  final String title;
  final AsyncValue<List> channelProvider;
  final AsyncValue<List<ItemCategory>> categories;
  final String placeHolderForSearchField;
  final double height;
  final double width;
  final TextEditingController searchController;
  final Widget Function(BuildContext, double, dynamic) itemBuilder;

  final String errorText;
  final Function(ItemCategory?) onCategoryChanged;

  final bool showBackButton;

  const GridLayoutWidget({
    super.key,
    required this.title,
    required this.channelProvider,
    required this.categories,
    required this.placeHolderForSearchField,
    required this.height,
    required this.width,
    required this.errorText,
    required this.onCategoryChanged,
    required this.searchController,
    required this.itemBuilder,
    this.showBackButton = false,
  });

  @override
  ConsumerState<GridLayoutWidget> createState() => _GridLayoutWidgetState();
}

class _GridLayoutWidgetState extends ConsumerState<GridLayoutWidget> {
  late TextEditingController searchController;
  int _pageIndex = 0;

  int calculateCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1300) {
      return 5;
    } else if (width > 900) {
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
  }

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      pane: NavigationPane(
        selected: _pageIndex,
        onChanged: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        items: loadCategories(),
      ),
    );
  }

  Widget content() {
    final isUpdating = ref.watch(isUpdatingActiveIptvServerProvider);

    return !isUpdating
        ? Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextBox(
                  controller: widget.searchController,
                  placeholder: widget.placeHolderForSearchField,
                ),
              ),
              Expanded(
                child: widget.channelProvider.when(
                  data: (channels) {
                    if (channels.isNotEmpty) {
                      var size = MediaQuery.of(context).size;
                      final double itemWidth = (size.height) / widget.width;
                      final double itemHeight = (size.height) / widget.height;
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: calculateCrossAxisCount(context),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: (itemWidth / itemHeight),
                        ),
                        itemBuilder: (_, index) => widget.itemBuilder(
                          context,
                          itemHeight,
                          channels[index],
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
                  loading: () => const LoadingIndicator(
                    message: 'Loading content...',
                  ),
                ),
              ),
            ],
          )
        : const LoadingIndicator();
  }

  List<NavigationPaneItem> loadCategories() {
    return widget.categories.when(
      data: (data) => [
        PaneItem(
          icon: const Icon(FluentIcons.home),
          title: const Text('All'),
          body: _NavigationBodyItem(
            content: content(),
          ),
          onTap: () {
            setState(() {
              widget.onCategoryChanged(null);
            });
          },
        ),
        for (var category in data)
          PaneItem(
            icon: const Icon(FluentIcons.home),
            title: Text("${category.categoryName}"),
            body: _NavigationBodyItem(
              content: content(),
            ),
            onTap: () {
              setState(() {
                widget.onCategoryChanged(category);
              });
            },
          ),
      ],
      error: (error, stackTrace) => [],
      loading: () => [],
    );
  }

  List<NavigationPaneItem> items = [
    PaneItem(
      icon: const Icon(FluentIcons.home),
      title: const Text('All'),
      body: const _NavigationBodyItem(),
    ),
  ];
}

class _NavigationBodyItem extends StatelessWidget {
  const _NavigationBodyItem({
    this.content,
  });

  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.withPadding(
      content: content ?? const SizedBox.shrink(),
    );
  }
}
