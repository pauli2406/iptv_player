import 'package:fluent_ui/fluent_ui.dart';
import 'package:play_shift/provider/models/provider_models.dart';

class SeriesCrewInfoSection extends StatelessWidget {
  const SeriesCrewInfoSection({
    super.key,
    required int? selectedSeason,
    required int? selectedEpisodeIndex,
    required this.context,
    required this.data,
  })  : _selectedSeason = selectedSeason,
        _selectedEpisodeIndex = selectedEpisodeIndex;

  final int? _selectedSeason;
  final int? _selectedEpisodeIndex;
  final BuildContext context;
  final SeriesWithInfo data;

  @override
  Widget build(BuildContext context) {
    if (_selectedSeason != null && _selectedEpisodeIndex != null) {
      return const SizedBox.shrink();
    }

    // Return empty widget if no director and no cast
    if (data.director == null && data.cast == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (data.director?.isNotEmpty == true) ...[
          Text(
            'Director',
            style: FluentTheme.of(context).typography.subtitle,
          ),
          const SizedBox(height: 8),
          Text(
            data.director!,
            style: FluentTheme.of(context).typography.body,
          ),
          const SizedBox(height: 16),
        ],
        if (data.cast?.isNotEmpty == true) ...[
          Text(
            'Cast',
            style: FluentTheme.of(context).typography.subtitle,
          ),
          const SizedBox(height: 8),
          Text(
            data.cast!,
            style: FluentTheme.of(context).typography.body,
          ),
          const SizedBox(height: 24),
        ],
      ],
    );
  }
}
