import 'package:iptv_player/service/collections/epg_item.dart';
import 'package:iptv_player/service/collections/item_category.dart';
import 'package:iptv_player/service/collections/iptv_server/iptv_server.dart';
import 'package:iptv_player/service/collections/channel_item.dart';
import 'package:iptv_player/service/collections/series_episode.dart';
import 'package:iptv_player/service/collections/series_info.dart';
import 'package:iptv_player/service/collections/series_item.dart';
import 'package:iptv_player/service/collections/series_season.dart';
import 'package:iptv_player/service/collections/theme/theme.dart';
import 'package:iptv_player/service/collections/vod_item.dart';
import 'package:isar/isar.dart';

const List<CollectionSchema> allSchemas = [
  IptvServerSchema,
  ThemeCollectionSchema,
  ItemCategorySchema,
  ChannelItemSchema,
  SeriesItemSchema,
  SeriesSeasonSchema,
  SeriesEpisodeSchema,
  SeriesInfoSchema,
  VodItemSchema,
  EpgItemSchema,
];
