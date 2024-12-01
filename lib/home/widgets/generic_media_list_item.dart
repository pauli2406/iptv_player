import 'dart:async';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';

const _kBorderRadius = 10.0;

class MediaListItem extends StatefulWidget {
  const MediaListItem({
    required this.imageUrl,
    required this.title,
    required this.height,
    required this.onTap,
    this.subtitle,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.titleMaxLines = 1,
    super.key,
  });

  final String imageUrl;
  final String title;
  final String? subtitle;
  final double height;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? hoverBackgroundColor;
  final int titleMaxLines;

  @override
  State<MediaListItem> createState() => _MediaListItemState();
}

class _MediaListItemState extends State<MediaListItem> {
  bool isHovering = false;
  late ScrollController _titleScrollController;
  late ScrollController _subtitleScrollController;
  Timer? _titleScrollTimer;
  Timer? _subtitleScrollTimer;

  static const _scrollDelay = Duration(milliseconds: 500);
  static const _resetScrollDuration = Duration(milliseconds: 200);

  @override
  void initState() {
    super.initState();
    _titleScrollController = ScrollController();
    _subtitleScrollController = ScrollController();
  }

  @override
  void dispose() {
    _titleScrollTimer?.cancel();
    _subtitleScrollTimer?.cancel();
    _titleScrollController.dispose();
    _subtitleScrollController.dispose();
    super.dispose();
  }

  void _startScrolling(ScrollController controller, Timer? timer) {
    if (!controller.hasClients || !isHovering) return;

    timer?.cancel();
    timer = Timer(_scrollDelay, () {
      if (!controller.hasClients || !isHovering) return;

      final maxScroll = controller.position.maxScrollExtent;
      if (maxScroll <= 0) return;

      controller.animateTo(
        maxScroll,
        duration: Duration(milliseconds: (maxScroll * 20).toInt()),
        curve: Curves.linear,
      );
    });
  }

  void _resetScroll(ScrollController controller) {
    if (controller.hasClients) {
      controller.animateTo(
        0,
        duration: _resetScrollDuration,
        curve: Curves.easeOut,
      );
    }
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(_kBorderRadius),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          FastCachedImage(
            fit: BoxFit.cover,
            url: widget.imageUrl,
            loadingBuilder: (context, progress) => Center(
              child: ProgressRing(
                value: progress.progressPercentage.value,
              ),
            ),
            errorBuilder: (_, __, ___) => const Icon(FluentIcons.error),
          ),
          if (FluentTheme.of(context).brightness == Brightness.dark)
            Container(
              color: Colors.black.withOpacity(0.2),
            ),
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(_kBorderRadius),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 4.0,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final textStyle = DefaultTextStyle.of(context).style;
                final textPainter = TextPainter(
                  text: TextSpan(
                    text: widget.title,
                    style: textStyle,
                  ),
                  maxLines: widget.titleMaxLines,
                  textDirection: TextDirection.ltr,
                )..layout(maxWidth: constraints.maxWidth);

                final exceededMaxLines = textPainter.didExceedMaxLines;
                return exceededMaxLines
                    ? SingleChildScrollView(
                        controller: _titleScrollController,
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          widget.title,
                          style: textStyle,
                        ),
                      )
                    : Text(
                        widget.title,
                        style: textStyle,
                        maxLines: widget.titleMaxLines,
                        overflow: TextOverflow.ellipsis,
                      );
              },
            ),
          ),
          if (widget.subtitle != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SingleChildScrollView(
                controller: _subtitleScrollController,
                scrollDirection: Axis.horizontal,
                child: Text(widget.subtitle!),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: (_) => setState(() {
        isHovering = false;
        _resetScroll(_titleScrollController);
        _resetScroll(_subtitleScrollController);
      }),
      onHover: (_) => setState(() {
        isHovering = true;
        _startScrolling(_titleScrollController, _titleScrollTimer);
        _startScrolling(_subtitleScrollController, _subtitleScrollTimer);
      }),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_kBorderRadius),
            color: isHovering
                ? widget.hoverBackgroundColor
                : widget.backgroundColor,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: _buildImage(),
              ),
              Expanded(
                flex: 2,
                child: _buildInfo(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
