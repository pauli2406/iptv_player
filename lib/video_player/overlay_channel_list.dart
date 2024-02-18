import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iptv_player/provider/isar/m3u_provider.dart';

typedef OnChannelSelectedCallback = void Function(ChannelViewModel channel);

class OverlayChannelListWidget extends StatefulWidget {
  final AsyncValue<List<ChannelViewModel>> channels;
  final Function onClose;
  final OnChannelSelectedCallback onChannelSelected;

  const OverlayChannelListWidget({
    super.key,
    required this.channels,
    required this.onClose,
    required this.onChannelSelected,
  });

  @override
  _OverlayChannelListWidgetState createState() =>
      _OverlayChannelListWidgetState();
}

class _OverlayChannelListWidgetState extends State<OverlayChannelListWidget> {
  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'Other Channels',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  widget.onClose();
                },
              ),
            ],
          ),
          Expanded(
            child: widget.channels.when(
              data: (channels) {
                return ListView.builder(
                  itemCount: channels.length,
                  prototypeItem: InkWell(
                    child: Container(
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              channels.first.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              utf8.decode(
                                base64.decode(
                                  channels.first.currentEpgItem?.title ?? '',
                                ),
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => widget.onChannelSelected(channels[index]),
                      onHover: (value) {
                        setState(() {
                          _hoveredIndex = value ? index : null;
                        });
                      },
                      child: Container(
                        color: _hoveredIndex == index ? Colors.blue : null,
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                channels[index].title,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                utf8.decode(
                                  base64.decode(
                                    channels[index].currentEpgItem?.title ?? '',
                                  ),
                                ),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              error: (error, _) => const ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Error loading channels",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              loading: () => const CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
