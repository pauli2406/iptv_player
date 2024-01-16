import 'package:isar/isar.dart';

part 'm3u_meta_data.g.dart';

@collection
class M3UMetaData {
  Id id = Isar.autoIncrement;

  String title;

  String? tvgId;

  bool watched;
  bool starred;

  M3UMetaData(this.title, this.tvgId,
      {this.watched = false, this.starred = false});
}
