import 'package:iptv_player/service/collections/epg_item.dart';
import 'package:iptv_player/service/collections/iptv_server/iptv_server.dart';
import 'package:isar/isar.dart';
import 'package:xtream_code_client/xtream_code_client.dart';

part 'channel_item.g.dart';

@Collection()
class ChannelItem {
  ChannelItem(
      {required this.id,
      this.num,
      this.name,
      this.streamType,
      this.streamIcon,
      this.epgChannelId,
      this.added,
      this.customSid,
      this.tvArchive,
      this.directSource,
      this.tvArchiveDuration,
      this.categoryId,
      required this.categoryIds,
      this.thumbnail,
      required this.streamUrl});

  Id? id;
  final int? num;
  final String? name;
  final String? streamType;
  final String? streamIcon;
  final String? epgChannelId;
  final DateTime? added;
  final int? customSid;
  final int? tvArchive;
  final String? directSource;
  final int? tvArchiveDuration;
  final int? categoryId;
  final List<int> categoryIds;
  final String? thumbnail;
  final String streamUrl;
  final iptvServer = IsarLink<IptvServer>();
  final epgItems = IsarLinks<EpgItem>();

  ChannelItem.fromLiveStreamItem(
    XTremeCodeLiveStreamItem liveStreamItem,
    this.streamUrl,
  )   : id = liveStreamItem.streamId,
        num = liveStreamItem.num,
        name = liveStreamItem.name,
        streamType = liveStreamItem.streamType,
        streamIcon = liveStreamItem.streamIcon,
        epgChannelId = liveStreamItem.epgChannelId,
        added = liveStreamItem.added,
        customSid = liveStreamItem.customSid,
        tvArchive = liveStreamItem.tvArchive,
        directSource = liveStreamItem.directSource,
        tvArchiveDuration = liveStreamItem.tvArchiveDuration,
        categoryId = liveStreamItem.categoryId,
        categoryIds = liveStreamItem.categoryIds,
        thumbnail = liveStreamItem.thumbnail;
}
