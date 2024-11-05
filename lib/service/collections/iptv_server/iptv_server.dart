import 'package:isar/isar.dart';

part 'iptv_server.g.dart';

@collection
class IptvServer {
  Id id;

  String name;

  String url;

  String port;

  String user;

  String password;

  DateTime? lastSync;

  List<String> allowedOutputFormats = [];

  IptvServer(
    this.name,
    this.url,
    this.port,
    this.user,
    this.password, {
    this.id = Isar.autoIncrement,
    this.lastSync,
  });
}
