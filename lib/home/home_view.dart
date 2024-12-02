import 'package:auto_route/auto_route.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:play_shift/home/views/channels/channels_page.dart';
import 'package:play_shift/home/views/movies/movie_page.dart';
import 'package:play_shift/home/views/series/series_page.dart';
import 'package:play_shift/provider/isar/iptv_server_provider.dart';
import 'package:play_shift/provider/isar/m3u_provider.dart';
import 'package:play_shift/theme.dart';
import 'package:play_shift/widgets/loading_indicator.dart';

@RoutePage()
class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  int _categoryIndex = 0;

  static final List<NavigationPaneItem> _baseItems = [
    PaneItemAction(
      icon: const Icon(FluentIcons.back),
      onTap: () {}, // Will be set in items() method
    ),
    PaneItemSeparator(),
    PaneItem(
      icon: const Icon(FluentIcons.t_v_monitor),
      title: const Text('Channels'),
      body: const _NavigationBodyItem(
        header: 'Channels',
        content: ChannelsPage(),
      ),
    ),
    PaneItem(
      icon: const Icon(FluentIcons.my_movies_t_v),
      title: const Text('Movies'),
      body: const _NavigationBodyItem(
        header: 'Movies',
        content: MoviesPage(),
      ),
    ),
    PaneItem(
      icon: const Icon(FluentIcons.bookmarks),
      title: const Text('Series'),
      body: const _NavigationBodyItem(
        header: 'Series',
        content: SeriesPage(),
      ),
    ),
  ];

  List<NavigationPaneItem> items(BuildContext context) {
    // Only modify the back action, reuse other static items
    _baseItems[0] = PaneItemAction(
      icon: const Icon(FluentIcons.back),
      onTap: () {
        ref.read(m3uServiceProvider).disposeXtreamCodeClient();
        Navigator.pop(context);
      },
    );
    return _baseItems;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(appThemeProvider);

    return ref.watch(clearDownloadAndPersistActivePlaylistItemsProvider()).when(
      data: (reloaded) {
        return NavigationView(
          appBar: const NavigationAppBar(height: 0),
          pane: NavigationPane(
            displayMode: PaneDisplayMode.top,
            selected: _categoryIndex,
            onChanged: (index) {
              setState(() => _categoryIndex = index);
            },
            items: items(context),
            footerItems: [
              PaneItemHeader(
                header: _ServerInfoFooter(currentTheme: currentTheme),
              ),
            ],
          ),
        );
      },
      error: (error, __) {
        debugPrint(error.toString());
        return const Text("Error");
      },
      loading: () {
        setState(() {});
        return const LoadingIndicator();
      },
    );
  }
}

class _ServerInfoFooter extends ConsumerWidget {
  final ThemeMode currentTheme;

  const _ServerInfoFooter({required this.currentTheme});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(activeIptvServerProvider).when(
          data: (data) => _buildServerInfo(context, ref, data),
          error: (_, __) => Text(
            "Error",
            style: FluentTheme.of(context).typography.caption,
          ),
          loading: () => const Center(
            child: ProgressRing(strokeWidth: 2),
          ),
        );
  }

  Widget _buildServerInfo(BuildContext context, WidgetRef ref, dynamic data) {
    final inputFormat = DateFormat('dd/MM/yyyy HH:mm');
    return Row(
      children: [
        Text(
          "Active Server: ${data?.name}",
          style: FluentTheme.of(context).typography.caption,
        ),
        const SizedBox(width: 20),
        Text(
          "Last Sync at: ${inputFormat.format(data!.lastSync!)}",
          style: FluentTheme.of(context).typography.caption,
        ),
        const SizedBox(width: 20),
        _buildRefreshButton(ref),
        _buildThemeToggle(ref),
      ],
    );
  }

  Widget _buildRefreshButton(WidgetRef ref) {
    return IconButton(
      icon: const Icon(CupertinoIcons.refresh, size: 15),
      onPressed: () async {
        ref.read(isUpdatingActiveIptvServerProvider.notifier).toggle();
        await ref
            .read(iptvServerServiceProvider)
            .refreshServerItems(forced: true);
        ref.read(isUpdatingActiveIptvServerProvider.notifier).toggle();
      },
    );
  }

  Widget _buildThemeToggle(WidgetRef ref) {
    return IconButton(
      icon: const Icon(FluentIcons.color),
      onPressed: () {
        ref.read(appThemeProvider.notifier).setAndPersistThemeMode(
              currentTheme == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light,
            );
      },
    );
  }
}

class _NavigationBodyItem extends ConsumerWidget {
  const _NavigationBodyItem({
    this.header,
    this.content,
  });

  final String? header;
  final Widget? content;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldPage.withPadding(
      header: PageHeader(title: Text(header ?? 'This is a header text')),
      content: content ?? const SizedBox.shrink(),
    );
  }
}
