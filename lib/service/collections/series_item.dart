import 'package:play_shift/service/collections/iptv_server/iptv_server.dart';
import 'package:isar/isar.dart';
import 'package:xtream_code_client/xtream_code_client.dart';

part 'series_item.g.dart';

@Collection()
class SeriesItem {
  SeriesItem({
    required this.id,
    this.num,
    this.name,
    this.title,
    this.year,
    this.streamType,
    this.cover,
    this.plot,
    this.cast,
    this.director,
    this.genre,
    this.releaseDate,
    this.lastModified,
    this.rating,
    this.rating5based,
    required this.backdropPath,
    this.youtubeTrailer,
    this.episodeRunTime,
    this.categoryId,
    required this.categoryIds,
    this.firstWatched,
    this.lastWatchedEpisodeId,
  });

  Id id;
  int? num;
  String? name;
  String? title;
  String? year;
  String? streamType;
  String? cover;
  String? plot;
  String? cast;
  String? director;
  String? genre;
  String? releaseDate;
  DateTime? lastModified;
  double? rating;
  double? rating5based;
  List<String> backdropPath;
  String? youtubeTrailer;
  int? episodeRunTime;
  int? categoryId;
  List<int> categoryIds;
  DateTime? firstWatched;
  int? lastWatchedEpisodeId;
  final iptvServer = IsarLink<IptvServer>();

  SeriesItem.fromXtreamCodeSeriesItem(
    XTremeCodeSeriesItem seriesItem,
  )   : id = seriesItem.seriesId!,
        num = seriesItem.num,
        name = seriesItem.name,
        title = seriesItem.title,
        year = seriesItem.year,
        streamType = seriesItem.streamType,
        cover = seriesItem.cover,
        plot = seriesItem.plot,
        cast = seriesItem.cast,
        director = seriesItem.director,
        genre = seriesItem.genre,
        releaseDate = seriesItem.releaseDate,
        lastModified = seriesItem.lastModified,
        rating = seriesItem.rating,
        rating5based = seriesItem.rating5based,
        backdropPath = seriesItem.backdropPath ?? [],
        youtubeTrailer = seriesItem.youtubeTrailer,
        episodeRunTime = seriesItem.episodeRunTime,
        categoryId = seriesItem.categoryId,
        categoryIds = seriesItem.categoryIds ?? [],
        firstWatched = null;

  XTremeCodeSeriesItem toXtreamCodeSeriesItem() {
    return XTremeCodeSeriesItem(
      seriesId: id,
      num: num,
      name: name,
      title: title,
      year: year,
      streamType: streamType,
      cover: cover,
      plot: plot,
      cast: cast,
      director: director,
      genre: genre,
      releaseDate: releaseDate,
      lastModified: lastModified,
      rating: rating,
      rating5based: rating5based,
      backdropPath: backdropPath,
      youtubeTrailer: youtubeTrailer,
      episodeRunTime: episodeRunTime,
      categoryId: categoryId,
      categoryIds: categoryIds,
    );
  }
}
