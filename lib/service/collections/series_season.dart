import 'package:isar/isar.dart';
import 'package:xtream_code_client/xtream_code_client.dart';

part 'series_season.g.dart';

@Collection()
class SeriesSeason {
  SeriesSeason({
    required this.id,
    this.airDate,
    this.episodeCount,
    this.seriesId,
    this.name,
    this.overview,
    this.seasonNumber,
    this.voteAverage,
    this.cover,
    this.coverBig,
  });

  Id? id;
  DateTime? airDate;
  int? episodeCount;
  int? seriesId;
  String? name;
  String? overview;
  int? seasonNumber;
  double? voteAverage;
  String? cover;
  String? coverBig;

  SeriesSeason.fromXtreamCodeSeriesSeason(XTremeCodeSeason seriesSeason)
      : id = Isar.autoIncrement,
        airDate = seriesSeason.airDate,
        episodeCount = seriesSeason.episodeCount,
        seriesId = seriesSeason.id,
        name = seriesSeason.name,
        overview = seriesSeason.overview,
        seasonNumber = seriesSeason.seasonNumber,
        voteAverage = seriesSeason.voteAverage,
        cover = seriesSeason.cover,
        coverBig = seriesSeason.coverBig;
}
