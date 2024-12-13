import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_shift/provider/isar/iptv_server_provider.dart';

class LoadingIndicator extends ConsumerWidget {
  final String message;

  const LoadingIndicator({
    super.key,
    this.message = 'Downloading and reading playlist...',
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          const SizedBox(height: 20),
          SizedBox(
            width: 300,
            child: ProgressBar(
              value: null,
            ),
          ),
          const SizedBox(height: 10),
          StreamBuilder<String>(
            stream: ref.read(iptvServerServiceProvider).progressStream,
            builder: (context, snapshot) {
              return Text(
                snapshot.data ?? 'Loading...',
                style: FluentTheme.of(context).typography.caption,
              );
            },
          ),
        ],
      ),
    );
  }
}
