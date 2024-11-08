import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:iptv_player/home/home_view_windows.dart';
import 'package:iptv_player/home/views/channels/channels_page.dart';
import 'package:iptv_player/home/views/movies/movie_page.dart';
import 'package:iptv_player/home/views/series/series_page.dart';
import 'package:iptv_player/provider/isar/iptv_server_provider.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:platform_builder/platform_builder.dart';

import '../provider/isar/m3u_provider.dart';

@RoutePage()
class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  int _categoryIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformBuilder(
      macOSBuilder: (context) => macOSHomeView(),
      windowsBuilder: (context) => const WindowsHomeView(),
      iOSBuilder: (context) => macOSHomeView(),
    );
  }

  Widget macOSHomeView() {
    return ref.watch(clearDownloadAndPersistActivePlaylistItemsProvider()).when(
          data: (activeServer) {
            var inputFormat = DateFormat('dd/MM/yyyy HH:mm');
            return MacosWindow(
                sidebar: Sidebar(
                  // decoration:
                  //     BoxDecoration(color: MacosTheme.of(context).canvasColor),
                  minWidth: 200,
                  top: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        MacosBackButton(
                          onPressed: () {
                            ref
                                .read(m3uServiceProvider)
                                .disposeXtreamCodeClient();
                            context.router.maybePop();
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Back",
                          style: MacosTheme.of(context).typography.headline,
                        ),
                      ],
                    ),
                  ),
                  bottom: Column(
                    children: [
                      ref.watch(activeIptvServerProvider).when(
                            data: (data) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Active Server: ${data?.name}",
                                    style: MacosTheme.of(context)
                                        .typography
                                        .headline,
                                  ),
                                  Text(
                                      "Last Sync at: ${inputFormat.format(data!.lastSync!)}",
                                      style: MacosTheme.of(context)
                                          .typography
                                          .subheadline),
                                ],
                              );
                            },
                            error: (_, __) => const Text("Error"),
                            loading: () => Container(),
                          ),
                      const SizedBox(
                        height: 5,
                      ),
                      MacosIconButton(
                        icon: const Icon(
                          CupertinoIcons.refresh,
                          size: 15,
                        ),
                        boxConstraints:
                            BoxConstraints.tight(const Size.square(30)),
                        shape: BoxShape.circle,
                        disabledColor: CupertinoColors.lightBackgroundGray,
                        onPressed: () async {
                          ref
                              .read(isUpdatingActiveIptvServerProvider.notifier)
                              .toggle();
                          await ref
                              .read(iptvServerServiceProvider)
                              .refreshServerItems(forced: true);
                          ref
                              .read(isUpdatingActiveIptvServerProvider.notifier)
                              .toggle();
                        },
                      ),
                    ],
                  ),
                  builder: (context, scrollController) {
                    return SidebarItems(
                      scrollController: scrollController,
                      currentIndex: _categoryIndex,
                      onChanged: (categoryIndex) {
                        setState(() => _categoryIndex = categoryIndex);
                      },
                      items: const [
                        SidebarItem(
                          leading: MacosIcon(CupertinoIcons.tv),
                          label: Text('Channels'),
                        ),
                        SidebarItem(
                          leading: MacosIcon(CupertinoIcons.film),
                          label: Text('Movies'),
                        ),
                        SidebarItem(
                          leading: MacosIcon(CupertinoIcons.film_fill),
                          label: Text('Series'),
                        ),
                      ],
                    );
                  },
                ),
                child: IndexedStack(
                  index: _categoryIndex,
                  children: const [
                    ChannelsPage(),
                    MoviesPage(),
                    SeriesPage(),
                    Center(
                      child: Text('Home'),
                    ),
                  ],
                ));
          },
          error: (error, __) {
            debugPrint(error.toString());
            return const Text("Error");
          },
          loading: () => MacosScaffold(
            children: [
              ContentArea(
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Downloading and reading playlist..."),
                        ProgressCircle(),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
  }
}
