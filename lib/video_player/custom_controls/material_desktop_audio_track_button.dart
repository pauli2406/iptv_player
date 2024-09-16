import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:media_kit_video/media_kit_video_controls/src/controls/methods/video_state.dart';

class MaterialDesktopAudioTrackButton extends StatefulWidget {
  const MaterialDesktopAudioTrackButton({
    super.key,
  });

  @override
  MaterialDesktopAudioTrackButtonState createState() =>
      MaterialDesktopAudioTrackButtonState();
}

class MaterialDesktopAudioTrackButtonState
    extends State<MaterialDesktopAudioTrackButton>
    with SingleTickerProviderStateMixin {
  late AudioTrack audio = controller(context).player.state.track.audio;
  late VideoTrack video = controller(context).player.state.track.video;
  late SubtitleTrack subtitle = controller(context).player.state.track.subtitle;

  bool hover = false;

  List<AudioTrack> _audios = [];
  List<VideoTrack> _videos = [];
  List<SubtitleTrack> _subtitles = [];

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void didChangeDependencies() {
    _audios = controller(context).player.state.tracks.audio;
    audio = controller(context).player.state.track.audio;
    _videos = controller(context).player.state.tracks.video;
    video = controller(context).player.state.track.video;
    _subtitles = controller(context).player.state.tracks.subtitle;
    subtitle = controller(context).player.state.track.subtitle;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final player = controller(context).player;
    return MouseRegion(
      onEnter: (e) {
        setState(() {
          hover = true;
        });
      },
      onExit: (e) {
        setState(() {
          hover = false;
        });
      },
      child: Row(
        children: [
          const SizedBox(width: 4.0),
          IconButton(
            onPressed: () async {
              _showTrackSelectionModal(context, player);
            },
            iconSize: _theme(context).buttonBarButtonSize * 0.8,
            color: _theme(context).buttonBarButtonColor,
            icon: const Icon(
              Icons.settings,
              key: ValueKey(Icons.settings),
            ),
          ),
        ],
      ),
    );
  }

  void _showTrackSelectionModal(BuildContext context, Player player) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return DefaultTabController(
          length: 3,
          child: Column(
            children: [
              const TabBar(
                tabs: [
                  Tab(text: 'Subtitle'),
                  Tab(text: 'Audio'),
                  Tab(text: 'Video'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildSubtitleTrackSelection(player),
                    _buildAudioTrackSelection(player),
                    _buildVideoTrackSelection(player),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAudioTrackSelection(Player player) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Select Audio Track', style: TextStyle(fontSize: 20)),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _audios.length,
            itemBuilder: (context, index) {
              final audioTrack = _audios[index];
              final isSelected = audioTrack.id == audio.id;
              return ListTile(
                title: Text(audioTrack.id == 'auto'
                    ? 'Auto'
                    : audioTrack.id == 'no'
                        ? 'No Audio'
                        : '${audioTrack.language ?? ''} ${audioTrack.channels != null ? '(${audioTrack.channels})' : ''} ${audioTrack.audiochannels ?? ''} ${audioTrack.codec ?? ''}'
                            .trim()),
                tileColor: isSelected ? Colors.grey[300] : null,
                onTap: isSelected
                    ? null
                    : () {
                        player.setAudioTrack(audioTrack);
                        Navigator.of(context).pop();
                      },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildVideoTrackSelection(Player player) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Select Video Track', style: TextStyle(fontSize: 20)),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _videos.length,
            itemBuilder: (context, index) {
              final videoTrack = _videos[index];
              final isSelected = video.id == videoTrack.id;
              return ListTile(
                title: Text(videoTrack.id == 'auto'
                    ? 'Auto'
                    : videoTrack.id == 'no'
                        ? 'No Video'
                        : '${videoTrack.codec} - FPS ${videoTrack.fps}'.trim()),
                tileColor: isSelected ? Colors.grey[300] : null,
                onTap: isSelected
                    ? null
                    : () {
                        player.setVideoTrack(videoTrack);
                        Navigator.of(context).pop();
                      },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSubtitleTrackSelection(Player player) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Select Subtitles', style: TextStyle(fontSize: 20)),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _subtitles.length,
            itemBuilder: (context, index) {
              final subtitleTrack = _subtitles[index];
              final isSelected = subtitleTrack.id == subtitle.id;
              return ListTile(
                title: Text(subtitleTrack.id == 'auto'
                    ? 'Auto'
                    : subtitleTrack.id == 'no'
                        ? 'No Subtitles'
                        : '${subtitleTrack.title ?? subtitleTrack.language}'
                            .trim()),
                tileColor: isSelected ? Colors.grey[300] : null,
                onTap: isSelected
                    ? null
                    : () {
                        player.setSubtitleTrack(subtitleTrack);
                        Navigator.of(context).pop();
                      },
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
