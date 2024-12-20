import 'package:isar/isar.dart';
import 'package:play_shift/service/collections/iptv_server/iptv_server.dart';
import 'package:xtream_code_client/xtream_code_client.dart';

part 'series_episode.g.dart';

@Collection()
class SeriesEpisode {
  SeriesEpisode({
    required this.id,
    required this.streamId,
    this.episodeNum,
    this.title,
    this.containerExtension,
    this.subtitles = const [],
    this.customSid,
    this.added,
    this.season,
    this.directSource,
    this.tmdbId,
    this.releaseDate,
    this.plot,
    this.durationSecs,
    this.duration,
    this.movieImage,
    this.bitrate,
    this.rating,
    this.coverBig,
    required this.streamUrl,
    this.watchedDuration,
    this.lastWatched,
    this.parentSeriesId,
  });

  Id? id;
  int? streamId;
  int? episodeNum;
  String? title;
  String? containerExtension;
  List<String> subtitles;
  String? customSid;
  DateTime? added;
  int? season;
  String? directSource;
  int? tmdbId;
  DateTime? releaseDate;
  String? plot;
  int? durationSecs;
  String? duration;
  String? movieImage;
  int? bitrate;
  double? rating;
  String? coverBig;
  String streamUrl;
  double? watchedDuration; // in seconds
  DateTime? lastWatched;
  
  @Index()
  final int? parentSeriesId;
  
  final iptvServer = IsarLink<IptvServer>();


  SeriesEpisode.fromXtreamCodeSeriesEpisode(
    XTremeCodeEpisode seriesEpisode,
    this.streamUrl,
    this.parentSeriesId,
  )   : id = seriesEpisode.id,
        streamId = seriesEpisode.id,
        episodeNum = seriesEpisode.episodeNum,
        title = seriesEpisode.title,
        containerExtension = seriesEpisode.containerExtension,
        subtitles = seriesEpisode.subtitles?? [],
        customSid = seriesEpisode.customSid,
        added = seriesEpisode.added,
        season = seriesEpisode.season,
        directSource = seriesEpisode.directSource,
        tmdbId = seriesEpisode.info.tmdbId,
        releaseDate = seriesEpisode.info.releaseDate,
        plot = seriesEpisode.info.plot,
        durationSecs = seriesEpisode.info.durationSecs,
        duration = seriesEpisode.info.duration,
        movieImage = seriesEpisode.info.movieImage,
        bitrate = seriesEpisode.info.bitrate,
        rating = seriesEpisode.info.rating,
        coverBig = seriesEpisode.info.coverBig,
        watchedDuration = null,
        lastWatched = null;
}
