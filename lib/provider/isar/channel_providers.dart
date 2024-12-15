import 'package:play_shift/home/provider/search_value_provider.dart';
import 'package:play_shift/provider/isar/m3u_provider.dart';
import 'package:play_shift/provider/models/channel_view_model.dart';
import 'package:play_shift/service/collections/epg_item.dart';
import 'package:play_shift/service/collections/item_category.dart';
import 'package:play_shift/service/m3u_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_providers.g.dart';

@riverpod
Stream<List<ChannelViewModel>> findAllChannels(
  FindAllChannelsRef ref, {
  ItemCategory? category,
}) async* {
  final searchValue = ref.watch(channelSearchValueProvider);
  final m3uService = ref.watch(m3uServiceProvider);

  await for (final channels
      in m3uService.findAllChannels(searchValue, category)) {
    final epgMap = _createCurrentEpgMap(m3uService);
    yield channels
        .map((channel) => _createChannelViewModel(channel, epgMap))
        .toList();
  }
}

@riverpod
ChannelViewModel findChannel(FindChannelRef ref, {required int streamId}) {
  final m3uService = ref.watch(m3uServiceProvider);
  final channel = m3uService.findChannel(streamId)!;
  var now = DateTime.now();
  EpgItem? latestEpgItem;
  List<EpgItem> epgItems = [];

  if (channel.epgChannelId != null) {
    epgItems = m3uService.epgOfChannel(channel.epgChannelId!);
    if (epgItems.isNotEmpty) {
      latestEpgItem = epgItems.firstWhere(
        (item) => _isEpgItemCurrent(item, now),
        orElse: () => epgItems.first,
      );
    }
  }

  return ChannelViewModel(
    channel.id,
    channel.streamUrl,
    channel.name ?? "",
    channel.streamIcon ?? "",
    channel.streamType == "live",
    latestEpgItem,
    epgItems,
  );
}

@riverpod
List<ChannelViewModel> findAlternativeChannels(
  FindAlternativeChannelsRef ref,
  String epgTitle,
  int currentChannelId,
) {
  final m3uService = ref.watch(m3uServiceProvider);
  final channels = m3uService.findChannelsByEpgTitle(epgTitle);

  return channels
      .where((channel) => channel.id != currentChannelId)
      .map((channel) {
    final currentEpg = m3uService.findCurrentEpgItem(channel);
    return ChannelViewModel(
      channel.id,
      channel.streamUrl,
      channel.name ?? "",
      channel.streamIcon ?? "",
      channel.streamType == "live",
      currentEpg,
      [],
    );
  }).toList();
}

@riverpod
Stream<List<ItemCategory>> findAllChannelGroups(FindAllChannelGroupsRef ref) {
  final m3uService = ref.watch(m3uServiceProvider);
  final activeIptvServer = m3uService.getActiveIptvServer()!;
  return m3uService.findAllChannelGroups(activeIptvServer);
}

// Helper functions
Map<String?, EpgItem> _createCurrentEpgMap(M3uService m3uService) {
  final now = DateTime.now();
  return Map.fromEntries(m3uService
      .epgOfChannels()
      .where((item) => _isEpgItemCurrent(item, now))
      .map((item) => MapEntry(item.channelId, item)));
}

bool _isEpgItemCurrent(EpgItem item, DateTime now) {
  return item.start != null &&
      item.end != null &&
      item.start!.isBefore(now) &&
      item.end!.isAfter(now);
}

ChannelViewModel _createChannelViewModel(
  dynamic channel,
  Map<String?, EpgItem> epgMap,
) {
  return ChannelViewModel(
    channel.id,
    channel.streamUrl,
    channel.name ?? "",
    channel.streamIcon ?? "",
    channel.streamType == "live",
    epgMap[channel.epgChannelId],
    [],
  );
}
