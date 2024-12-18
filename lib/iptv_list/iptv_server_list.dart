import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_shift/iptv_list/windows/windows_iptv_server_list.dart';
import 'package:platform_builder/platform_builder.dart';

@RoutePage()
class IptvServerList extends ConsumerWidget {
  const IptvServerList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformBuilder(
      macOSBuilder: (context) => const WindowsIptvServerList(),
      windowsBuilder: (context) => const WindowsIptvServerList(),
      iOSBuilder: (context) => const WindowsIptvServerList(),
    );
  }
}
