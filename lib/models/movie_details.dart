
import 'package:play_shift/provider/models/movie_view_model.dart';
import 'package:xtream_code_client/xtream_code_client.dart';

class MovieDetails {
  final MovieViewModel movie;
  final XTremeCodeVodInfo info;

  const MovieDetails({
    required this.movie,
    required this.info,
  });
}