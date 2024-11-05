import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'volume_value_provider.g.dart';

@Riverpod(keepAlive: true)
class VolumeValue extends _$VolumeValue {
  @override
  double build() {
    return 50.0;
  }

  void setValue(double value) {
    state = value;
  }
}