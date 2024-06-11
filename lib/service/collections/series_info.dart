import 'package:isar/isar.dart';
import 'package:xtream_code_client/xtream_code_client.dart';

part 'series_info.g.dart';

@Collection()
class SeriesInfo {
  SeriesInfo({
    required this.id,
    this.name,
    this.title,
    this.year,
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

  Id? id;
  String? name;
  String? title;
  String? year;
  String? cover;
  String? plot;
  String? cast;
  String? director;
  String? genre;
  DateTime? releaseDate;
  DateTime? lastModified;
  double? rating;
  double? rating5based;
  List<String> backdropPath = const [];
  String? youtubeTrailer;
  int? episodeRunTime;
  int? categoryId;
  List<int> categoryIds = const [];

  SeriesInfo.fromXTremeCodeSeriesInfo(XTremeCodeInfo info) {
    id = Isar.autoIncrement;
    name = info.name;
    title = info.title;
    year = info.year;
    cover = info.cover;
    plot = info.plot;
    cast = info.cast;
    director = info.director;
    genre = info.genre;
    releaseDate = info.releaseDate;
    lastModified = info.lastModified;
    rating = info.rating;
    rating5based = info.rating5based;
    backdropPath = info.backdropPath;
    youtubeTrailer = info.youtubeTrailer;
    episodeRunTime = info.episodeRunTime;
    categoryId = info.categoryId;
    categoryIds = info.categoryIds;
  }
}
