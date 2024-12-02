import 'package:play_shift/service/collections/epg_item.dart';
import 'package:play_shift/service/collections/item_category.dart';
import 'package:play_shift/service/collections/iptv_server/iptv_server.dart';
import 'package:play_shift/service/collections/channel_item.dart';
import 'package:play_shift/service/collections/series_item.dart';
import 'package:play_shift/service/collections/theme/theme.dart';
import 'package:play_shift/service/collections/vod_item.dart';
import 'package:isar/isar.dart';

const List<CollectionSchema> allSchemas = [
  IptvServerSchema,
  ThemeCollectionSchema,
  ItemCategorySchema,
  ChannelItemSchema,
  SeriesItemSchema,
  VodItemSchema,
  EpgItemSchema,
];
