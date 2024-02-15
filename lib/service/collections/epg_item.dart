import 'package:iptv_player/service/collections/iptv_server/iptv_server.dart';
import 'package:isar/isar.dart';
import 'package:xtream_code_client/xtream_code_client.dart';

part 'epg_item.g.dart';

@Collection()
class EpgItem {
  Id? id;

  @Index(type: IndexType.hash)
  final String epgId;

  final String? title;

  final String? lang;

  final DateTime? start;

  final DateTime? end;

  final String? description;

  @Index(type: IndexType.hash)
  final String channelId;

  final DateTime? startTimestamp;

  final DateTime? stopTimestamp;

  final iptvServer = IsarLink<IptvServer>();

  EpgItem(
    this.id,
    this.epgId,
    this.title,
    this.lang,
    this.start,
    this.end,
    this.description,
    this.channelId,
    this.startTimestamp,
    this.stopTimestamp,
  );

  EpgItem.fromXtreamCodeEpgItem(XTremeCodeEpgListing epgTableItem)
      : epgId = epgTableItem.epgId!,
        title = epgTableItem.title,
        lang = epgTableItem.lang,
        start = epgTableItem.start,
        end = epgTableItem.end,
        description = epgTableItem.description,
        channelId = epgTableItem.channelId!,
        startTimestamp = epgTableItem.startTimestamp,
        stopTimestamp = epgTableItem.stopTimestamp;
}
