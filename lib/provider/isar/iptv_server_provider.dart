import 'dart:async';

import 'package:play_shift/provider/isar/m3u_provider.dart';
import 'package:play_shift/service/collections/iptv_server/iptv_server.dart';
import 'package:play_shift/service/iptv_server_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'isar_provider.dart';

part 'iptv_server_provider.g.dart';

@Riverpod(keepAlive: true)
IptvServerService iptvServerService(IptvServerServiceRef ref) {
  final isar = ref.watch(getIsarProvider);
  final m3uService = ref.watch(m3uServiceProvider);
  return IptvServerService(isar, m3uService);
}

@riverpod
Stream<List<IptvServer>> iptvServerItems(IptvServerItemsRef ref) {
  return ref.watch(iptvServerServiceProvider).findAllStream();
}

@riverpod
Future<IptvServer?> activeIptvServer(ActiveIptvServerRef ref) async {
  final activeServer = ref.watch(m3uServiceProvider).getActiveIptvServer();
  if (activeServer == null) return null;
  return ref.watch(iptvServerServiceProvider).findById(activeServer.id);
}

@riverpod
class IsUpdatingActiveIptvServer extends _$IsUpdatingActiveIptvServer {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = !state;
  }
}
