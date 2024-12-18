import 'package:auto_route/auto_route.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_shift/router/app_router.gr.dart';
import 'package:play_shift/service/collections/iptv_server/iptv_server.dart';
import '../../provider/isar/iptv_server_provider.dart';
import '../../provider/isar/m3u_provider.dart';
import '../manage_iptv_server.dart';

class WindowsIptvServerList extends ConsumerWidget {
  const WindowsIptvServerList({super.key});

  String obscureUrl(String url) {
    final exp = RegExp(r"^(https?://[^/]+)");
    final match = exp.firstMatch(url);
    return "${match?.group(1)}********";
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverItems$ = ref.watch(iptvServerItemsProvider);
    return NavigationView(
      appBar: const NavigationAppBar(
        automaticallyImplyLeading: false,
        height: 0,
      ),
      content: _buildContentArea(context, ref, serverItems$),
    );
  }

  Widget _buildContentArea(BuildContext context, WidgetRef ref,
      AsyncValue<List<IptvServer>> serverItems$) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: serverItems$.map(
        data: (data) {
          final serverItems = data.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Playlists",
                    style: FluentTheme.of(context).typography.title,
                  ),
                  IconButton(
                    icon: const Icon(FluentIcons.add),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => ContentDialog(
                          constraints: const BoxConstraints.expand(width: 800),
                          title: const Text('Add IPTV Server'),
                          content: const ManageIptvServerItem(),
                          actions: [
                            Button(
                              child: const Text('Close'),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: _buildServerList(context, ref, serverItems),
              ),
            ],
          );
        },
        error: (error) {
          return Center(
            child: Text('Error: ${error.toString()}'),
          );
        },
        loading: (_) {
          return const Center(
            child: ProgressRing(),
          );
        },
      ),
    );
  }

  Widget _buildServerList(
      BuildContext context, WidgetRef ref, List<IptvServer> serverItems) {
    return ListView.builder(
      itemCount: serverItems.length,
      itemBuilder: (context, index) {
        final server = serverItems[index];
        return Card(
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      server.name,
                      style: FluentTheme.of(context).typography.subtitle,
                    ),
                    Text(
                      obscureUrl(server.url),
                      style: FluentTheme.of(context).typography.body,
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(FluentIcons.edit),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => ContentDialog(
                            constraints:
                                const BoxConstraints.expand(width: 800),
                            title: const Text('Edit IPTV Server'),
                            content: ManageIptvServerItem(iptvServer: server),
                            actions: [
                              Button(
                                child: const Text('Close'),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(FluentIcons.delete),
                      onPressed: () {
                        ref.read(iptvServerServiceProvider).delete(server.id);
                      },
                    ),
                  ],
                ),
              ],
            ),
            onPressed: () {
              ref.read(m3uServiceProvider).setActiveIptvServer(server);
              context.router.push(const HomeViewRoute());
            },
          ),
        );
      },
    );
  }
}
