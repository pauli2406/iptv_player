import 'package:play_shift/service/collections/iptv_server/iptv_server.dart';
import 'package:isar/isar.dart';
import 'package:xtream_code_client/xtream_code_client.dart';

part 'vod_item.g.dart';

@Collection()
class VodItem {
  VodItem({
    required this.id,
    this.num,
    this.name,
    this.title,
    this.year,
    this.streamType,
    this.streamIcon,
    this.rating,
    this.rating5based,
    this.added,
    this.categoryId,
    required this.categoryIds,
    this.containerExtension,
    this.customSid,
    this.directSource,
    required this.streamUrl,
    this.watchedDuration,
    this.lastWatched,
    this.durationSecs,
    this.duration,
    this.isFavorite = false,  // Add this line
  });

  final Id id;
  final int? num;
  final String? name;
  final String? title;
  final String? year;
  final String? streamType;
  final String? streamIcon;
  final double? rating;
  final double? rating5based;
  final DateTime? added;
  final int? categoryId;
  final List<int> categoryIds;
  final String? containerExtension;
  final String? customSid;
  final String? directSource;
  final String streamUrl;
  double? watchedDuration; // in seconds
  DateTime? lastWatched;
  int? durationSecs;
  String? duration;
  bool isFavorite;  // Add this line
  final iptvServer = IsarLink<IptvServer>();

  VodItem.fromXtreamCodeVodItem(
    XTremeCodeVodItem vodItem,
    this.streamUrl, {
    this.watchedDuration,
    this.lastWatched,
    this.durationSecs,
    this.duration,
  })   : id = vodItem.streamId!,
        num = vodItem.num,
        name = vodItem.name,
        title = vodItem.title,
        year = vodItem.year,
        streamType = vodItem.streamType,
        streamIcon = vodItem.streamIcon,
        rating = vodItem.rating,
        rating5based = vodItem.rating5based,
        added = vodItem.added,
        categoryId = vodItem.categoryId,
        categoryIds = vodItem.categoryIds ?? [],
        containerExtension = vodItem.containerExtension,
        customSid = vodItem.customSid,
        directSource = vodItem.directSource,
        isFavorite = false;  // Add this line

  XTremeCodeVodItem toXtreamCodeVodItem() {
    return XTremeCodeVodItem(
      streamId: id,
      num: num,
      name: name,
      title: title,
      year: year,
      streamType: streamType,
      streamIcon: streamIcon,
      rating: rating,
      rating5based: rating5based,
      added: added,
      categoryId: categoryId,
      categoryIds: categoryIds,
      containerExtension: containerExtension,
      customSid: customSid,
      directSource: directSource,
    );
  }
}
