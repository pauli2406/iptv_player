import 'package:play_shift/provider/isar/iptv_server_provider.dart';
import 'package:play_shift/provider/isar/isar_provider.dart';
import 'package:play_shift/service/m3u_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'm3u_provider.g.dart';

@Riverpod(keepAlive: true)
M3uService m3uService(M3uServiceRef ref) {
  final isar = ref.read(getIsarProvider);
  return M3uService(isar);
}

@riverpod
Future<bool> clearDownloadAndPersistActivePlaylistItems(
  ClearDownloadAndPersistActivePlaylistItemsRef ref, {
  bool? forced,
}) async {
  final iptvService = ref.watch(iptvServerServiceProvider);
  await iptvService.refreshServerItems(forced: forced);
  ref.notifyListeners();
  return true;
}
