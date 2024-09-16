import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iptv_player/provider/isar/m3u_provider.dart';

typedef OnChannelSelectedCallback = void Function(ChannelViewModel channel);

class OverlayChannelListWidget extends StatefulWidget {
  final AsyncValue<List<ChannelViewModel>> channels;
  final VoidCallback onClose;
  final OnChannelSelectedCallback onChannelSelected;

  const OverlayChannelListWidget({
    super.key,
    required this.channels,
    required this.onClose,
    required this.onChannelSelected,
  });

  @override
  OverlayChannelListWidgetState createState() =>
      OverlayChannelListWidgetState();
}

class OverlayChannelListWidgetState extends State<OverlayChannelListWidget> {
  int? _hoveredIndex;
  final searchTextNotifier = ValueNotifier<String>('');

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
          _buildHeader(),
          _buildSearchField(),
          _buildChannelList(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white, width: 1.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: widget.onClose,
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) => searchTextNotifier.value = value,
        decoration: const InputDecoration(
          hintText: 'Search channels...',
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildChannelList() {
    return Expanded(
      child: ValueListenableBuilder<String>(
        valueListenable: searchTextNotifier,
        builder: (context, searchText, _) {
          return widget.channels.when(
            data: (channels) => _buildListView(channels, searchText),
            error: (_, __) => const ListTile(
              title: Text(
                "Error loading channels",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            loading: () => const CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildListView(List<ChannelViewModel> channels, String searchText) {
    final filteredChannels = channels
        .where((channel) =>
            channel.title.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    if (filteredChannels.isEmpty) {
      return const ListTile(
        title: Text(
          "No channels found",
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      itemCount: filteredChannels.length,
      itemBuilder: (context, index) {
        final channel = filteredChannels[index];
        return InkWell(
          onTap: () => widget.onChannelSelected(channel),
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
                    channel.title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Text(
                    channel.currentEpgItem?.title ?? '',
                    style: const TextStyle(color: Colors.white, fontSize: 8),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
