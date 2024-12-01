import 'package:isar/isar.dart';
import 'package:xtream_code_client/xtream_code_client.dart';
import 'package:iptv_player/service/collections/iptv_server/iptv_server.dart';

part 'epg_item.g.dart';

@collection
class EpgItem {
  Id id = Isar.autoIncrement;
  
  @Index()
  late String channelId;
  
  late String? title;
  late DateTime? start;
  late DateTime? end;
  late String? description;
  final iptvServer = IsarLink<IptvServer>();
  
  EpgItem({
    this.id = Isar.autoIncrement,
    this.title,
    this.description,
    this.start,
    this.end,
    required this.channelId,
  });

  factory EpgItem.fromProgramme(Programme programme, String channelId, IptvServer server) {
    return EpgItem(
      title: programme.titles.isNotEmpty ? programme.titles.first.value : null,
      description: programme.descs.isNotEmpty ? programme.descs.first.value : null,
      start: programme.start,
      end: programme.stop ?? programme.start.add(const Duration(hours: 1)), // Default to 1 hour if no end time
      channelId: channelId,
    )..iptvServer.value = server;
  }

  factory EpgItem.fromXtreamCodeEpgItem(XTremeCodeEpgListing epgTableItem) {
    return EpgItem(
      title: epgTableItem.title,
      description: epgTableItem.description,
      start: epgTableItem.startTimestamp,
      end: epgTableItem.stopTimestamp,
      channelId: epgTableItem.channelId!,
    );
  }
}
