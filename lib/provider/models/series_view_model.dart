
import 'package:iptv_player/service/collections/epg_item.dart';

class SeriesViewModel {
  int? streamId;
  String link, title, logoUrl;
  bool isLive;
  EpgItem? currentEpgItem;

  SeriesViewModel(
    this.streamId,
    this.link,
    this.title,
    this.logoUrl,
    this.isLive,
    this.currentEpgItem,
  );
}