
import 'package:iptv_player/service/collections/epg_item.dart';

class ChannelViewModel {
  int? streamId;
  String link, title, logoUrl;
  bool isLive;
  EpgItem? currentEpgItem;
  List<EpgItem> epgItems;

  ChannelViewModel(
    this.streamId,
    this.link,
    this.title,
    this.logoUrl,
    this.isLive,
    this.currentEpgItem,
    this.epgItems,
  );
}