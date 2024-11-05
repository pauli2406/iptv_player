import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:iptv_player/home/views/channels/channels_page.dart';
import 'package:iptv_player/home/views/movies/movie_page.dart';
import 'package:iptv_player/home/views/series/series_page.dart';
import 'package:iptv_player/provider/isar/iptv_server_provider.dart';
import 'package:fluent_ui/fluent_ui.dart'; // Changed import
import 'package:iptv_player/theme.dart';
import '../provider/isar/m3u_provider.dart';

class WindowsHomeView extends ConsumerStatefulWidget {
  const WindowsHomeView({super.key});

  @override
  ConsumerState<WindowsHomeView> createState() => _WindowsHomeViewState();
}

class _WindowsHomeViewState extends ConsumerState<WindowsHomeView> {
  int _categoryIndex = 0;

  List<NavigationPaneItem> items(BuildContext context) {
    return [
      PaneItemAction(
        icon: const Icon(FluentIcons.back), // Changed icon
        onTap: () {
          ref.read(m3uServiceProvider).disposeXtreamCodeClient();
          Navigator.pop(context);
        },
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
        var inputFormat = DateFormat('dd/MM/yyyy HH:mm');
        return NavigationView(
          appBar: const NavigationAppBar(),
          pane: NavigationPane(
            displayMode: PaneDisplayMode.top,
            selected: _categoryIndex,
            onChanged: (index) {
              setState(() => _categoryIndex = index);
            },
            items: items(context),
            footerItems: [
              PaneItemHeader(
                header: ref.watch(activeIptvServerProvider).when(
                      data: (data) {
                        return Row(
                          children: [
                            Text(
                              "Active Server: ${data?.name}",
                              style: FluentTheme.of(context).typography.caption,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Last Sync at: ${inputFormat.format(data!.lastSync!)}",
                              style: FluentTheme.of(context).typography.caption,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            IconButton(
                              icon: const Icon(
                                CupertinoIcons.refresh,
                                size: 15,
                              ),
                              onPressed: () async {
                                ref
                                    .read(isUpdatingActiveIptvServerProvider
                                        .notifier)
                                    .toggle();
                                await ref
                                    .read(iptvServerServiceProvider)
                                    .refreshServerItems(forced: true);
                                ref
                                    .read(isUpdatingActiveIptvServerProvider
                                        .notifier)
                                    .toggle();
                              },
                            ),
                            IconButton(
                                icon: const Icon(FluentIcons.color),
                                onPressed: () {
                                  ref
                                      .read(appThemeProvider.notifier)
                                      .setAndPersistThemeMode(
                                        currentTheme == ThemeMode.light
                                            ? ThemeMode.dark
                                            : ThemeMode.light,
                                      );
                                }),
                          ],
                        );
                      },
                      error: (_, __) => const Text("Error"),
                      loading: () => Container(),
                    ),
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
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Downloading and reading playlist..."),
              ProgressRing(), // Changed to ProgressRing
            ],
          ),
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
