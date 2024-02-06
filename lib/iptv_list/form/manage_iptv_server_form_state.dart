import 'package:formz/formz.dart';
import 'package:iptv_player/iptv_list/form/port_input.dart';
import 'package:iptv_player/iptv_list/form/text_input.dart';
import 'package:iptv_player/iptv_list/form/url_input.dart';
import 'package:isar/isar.dart';

class ManageIptvServerFormState with FormzMixin {
  ManageIptvServerFormState({
    this.id,
    this.name = const TextInput.pure(),
    this.url = const UrlInput.pure(),
    this.port = const PortInput.pure(),
    this.user = const TextInput.pure(),
    this.password = const TextInput.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  final Id? id;
  final TextInput name;
  final UrlInput url;
  final PortInput port;
  final TextInput user;
  final TextInput password;
  final FormzSubmissionStatus status;

  ManageIptvServerFormState copyWith({
    Id? id,
    TextInput? name,
    UrlInput? url,
    PortInput? port,
    TextInput? user,
    TextInput? password,
    FormzSubmissionStatus? status,
  }) {
    return ManageIptvServerFormState(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
      port: port ?? this.port,
      user: user ?? this.user,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<FormzInput> get inputs => [name, url, port, user, password];
}
