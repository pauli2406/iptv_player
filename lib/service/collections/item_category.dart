import 'package:play_shift/service/collections/iptv_server/iptv_server.dart';
import 'package:isar/isar.dart';
import 'package:xtream_code_client/xtream_code_client.dart';

part 'item_category.g.dart';

@Collection()
class ItemCategory {
  final Id id;
  final String? categoryName;
  final int? parentId;
  @enumerated
  ItemCategoryType type;
  final iptvServer = IsarLink<IptvServer>();

  ItemCategory(this.id, this.categoryName, this.parentId, this.type);

  ItemCategory.fromCategory(XTremeCodeCategory category, this.type)
      : id = category.categoryId!,
        categoryName = category.categoryName,
        parentId = category.parentId;
}

enum ItemCategoryType {
  channel,
  series,
  vod,
}
