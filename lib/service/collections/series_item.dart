import 'package:iptv_player/service/collections/iptv_server/iptv_server.dart';
import 'package:iptv_player/service/collections/series_episode.dart';
import 'package:iptv_player/service/collections/series_info.dart';
import 'package:iptv_player/service/collections/series_season.dart';
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
  String? rating;
  double? rating5based;
  List<String> backdropPath;
  String? youtubeTrailer;
  String? episodeRunTime;
  String? categoryId;
  List<int> categoryIds;
  final iptvServer = IsarLink<IptvServer>();
  final seasons = IsarLinks<SeriesSeason>();
  final info = IsarLink<SeriesInfo>();
  final episodes = IsarLinks<SeriesEpisode>();

  SeriesItem.fromXtreamCodeSeriesItem(
    XTremeCodeSeriesItem seriesItem,
  )   : id = seriesItem.seriesId,
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
        backdropPath = seriesItem.backdropPath,
        youtubeTrailer = seriesItem.youtubeTrailer,
        episodeRunTime = seriesItem.episodeRunTime,
        categoryId = seriesItem.categoryId,
        categoryIds = seriesItem.categoryIds;
}
