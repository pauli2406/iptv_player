import 'package:fluent_ui/fluent_ui.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:media_kit_video/media_kit_video_controls/src/controls/methods/video_state.dart';

class MaterialDesktopAudioTrackButton extends StatefulWidget {
  const MaterialDesktopAudioTrackButton({super.key});
  @override
  MaterialDesktopAudioTrackButtonState createState() =>
      MaterialDesktopAudioTrackButtonState();
}

class MaterialDesktopAudioTrackButtonState
    extends State<MaterialDesktopAudioTrackButton> {
  late final Player _player = controller(context).player;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: Row(
        children: [
          const SizedBox(width: 4.0),
          IconButton(
            onPressed: () => _showTrackSelectionModal(context),
            icon: const Icon(FluentIcons.settings,
                key: ValueKey(FluentIcons.settings)),
            style: ButtonStyle(
              iconSize: WidgetStateProperty.all(
                  _theme(context).buttonBarButtonSize * 0.8),
              foregroundColor:
                  WidgetStateProperty.all(_theme(context).buttonBarButtonColor),
            ),
          ),
        ],
      ),
    );
  }

  void _showTrackSelectionModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ContentDialog(
        constraints: const BoxConstraints(maxWidth: 450, maxHeight: 600),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(FluentIcons.chrome_close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            Expanded(child: _TrackSelectionModal(player: _player)),
          ],
        ),
      ),
      barrierDismissible: true,
      dismissWithEsc: true,
    );
  }
}

class _TrackSelectionModal extends StatefulWidget {
  final Player player;
  const _TrackSelectionModal({required this.player});

  @override
  State<_TrackSelectionModal> createState() => _TrackSelectionModalState();
}

class _TrackSelectionModalState extends State<_TrackSelectionModal> {
  int currentIndex = 0;

  String _getTrackDisplayName<T>({
    required String id,
    required String type,
    required String Function() defaultFormat,
  }) =>
      switch (id) {
        "auto" => "Auto",
        "no" => "No $type",
        _ => defaultFormat(),
      };

  @override
  Widget build(BuildContext context) {
    return TabView(
      currentIndex: currentIndex,
      closeButtonVisibility: CloseButtonVisibilityMode.never,
      onChanged: (index) => setState(() => currentIndex = index),
      tabs: [
        Tab(
          text: const Text('Subtitle'),
          body: _TrackSelectionList<SubtitleTrack>(
            title: 'Select Subtitles',
            tracks: widget.player.state.tracks.subtitle,
            selectedTrack: widget.player.state.track.subtitle,
            onTrackSelected: widget.player.setSubtitleTrack,
            getDisplayName: (track) => _getTrackDisplayName(
              id: track.id,
              type: 'Subtitles',
              defaultFormat: () => track.title ?? track.language ?? 'Unknown',
            ),
          ),
        ),
        Tab(
          text: const Text('Audio'),
          body: _TrackSelectionList<AudioTrack>(
            title: 'Select Audio Track',
            tracks: widget.player.state.tracks.audio,
            selectedTrack: widget.player.state.track.audio,
            onTrackSelected: widget.player.setAudioTrack,
            getDisplayName: (track) => _getTrackDisplayName(
              id: track.id,
              type: 'Audio',
              defaultFormat: () =>
                  '${track.language ?? ''} ${track.channels != null ? '(${track.channels})' : ''} ${track.audiochannels ?? ''} ${track.codec ?? ''}'
                      .trim(),
            ),
          ),
        ),
        Tab(
          text: const Text('Video'),
          body: _TrackSelectionList<VideoTrack>(
            title: 'Select Video Track',
            tracks: widget.player.state.tracks.video,
            selectedTrack: widget.player.state.track.video,
            onTrackSelected: widget.player.setVideoTrack,
            getDisplayName: (track) => _getTrackDisplayName(
              id: track.id,
              type: 'Video',
              defaultFormat: () => '${track.codec} - FPS ${track.fps}',
            ),
          ),
        ),
      ],
    );
  }
}

class _TrackSelectionList<T> extends StatelessWidget {
  final String title;
  final List<T> tracks;
  final T selectedTrack;
  final Function(T) onTrackSelected;
  final String Function(T) getDisplayName;

  const _TrackSelectionList({
    required this.title,
    required this.tracks,
    required this.selectedTrack,
    required this.onTrackSelected,
    required this.getDisplayName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: FluentTheme.of(context).typography.title,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: tracks.length,
            itemBuilder: (context, index) {
              final track = tracks[index];
              final isSelected = track == selectedTrack;

              return ListTile.selectable(
                selected: isSelected,
                onPressed: isSelected
                    ? null
                    : () {
                        onTrackSelected(track);
                        Navigator.pop(context);
                      },
                title: Text(
                  getDisplayName(track),
                  style: FluentTheme.of(context).typography.body,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

MaterialDesktopVideoControlsThemeData _theme(BuildContext context) =>
    FullscreenInheritedWidget.maybeOf(context) == null
        ? MaterialDesktopVideoControlsTheme.maybeOf(context)?.normal ??
            kDefaultMaterialDesktopVideoControlsThemeData
        : MaterialDesktopVideoControlsTheme.maybeOf(context)?.fullscreen ??
            kDefaultMaterialDesktopVideoControlsThemeDataFullscreen;
