
import 'package:play_shift/service/collections/series_episode.dart';
import 'package:play_shift/service/collections/series_item.dart';
import 'package:play_shift/service/m3u_service.dart';
import 'package:xtream_code_client/xtream_code_client.dart';

class SeriesWithInfo {
  final SeriesItem series;
  final XTremeCodeSeriesInfo? seriesInfo;
  final Map<String, List<SeriesEpisode>> episodes;

  SeriesWithInfo(this.series, this.seriesInfo)
      : episodes = _createEpisodesMap(seriesInfo);

  static Map<String, List<SeriesEpisode>> _createEpisodesMap(
      XTremeCodeSeriesInfo? seriesInfo) {
    return seriesInfo?.episodes?.map(
          (season, episodes) => MapEntry(
            season,
            episodes
                .map((e) => SeriesEpisode.fromXtreamCodeSeriesEpisode(
                      e,
                      client.seriesUrl(e.id!, e.containerExtension!),
                    ))
                .toList(),
          ),
        ) ??
        {};
  }

  String? get plot => seriesInfo?.info.plot ?? series.plot;
  String? get cast => seriesInfo?.info.cast ?? series.cast;
  double? get rating => seriesInfo?.info.rating ?? series.rating;
  String? get year => seriesInfo?.info.year ?? series.year;
  String? get genre => seriesInfo?.info.genre;
  String? get director => seriesInfo?.info.director;
  int? get runtime => seriesInfo?.info.episodeRunTime;
  String? get youtubeTrailer => seriesInfo?.info.youtubeTrailer;
}