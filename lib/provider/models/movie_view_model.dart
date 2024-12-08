import 'package:play_shift/service/collections/vod_item.dart';

class MovieViewModel {
  final int streamId;
  final String streamUrl;
  final String title;
  final String? streamIcon;
  final String? year;
  final double? rating;
  final double? rating5based;
  final DateTime? added;
  final String? containerExtension;
  final String? directSource;

  MovieViewModel({
    required this.streamId,
    required this.streamUrl,
    required this.title,
    this.streamIcon,
    this.year,
    this.rating,
    this.rating5based,
    this.added,
    this.containerExtension,
    this.directSource,
  });

  factory MovieViewModel.fromVodItem(VodItem item) {
    return MovieViewModel(
      streamId: item.id,
      streamUrl: item.streamUrl,
      title: item.name ?? '',
      streamIcon: item.streamIcon,
      year: item.year,
      rating: item.rating,
      rating5based: item.rating5based,
      added: item.added,
      containerExtension: item.containerExtension,
      directSource: item.directSource,
    );
  }
}
