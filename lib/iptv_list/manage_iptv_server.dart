import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:iptv_player/iptv_list/form/port_input.dart';
import 'package:iptv_player/iptv_list/macOS/macos_mange_iptv_server_widget.dart';
import 'package:iptv_player/provider/isar/iptv_server_provider.dart';
import 'package:platform_builder/platform_builder.dart';

import '../service/collections/iptv_server/iptv_server.dart';
import 'form/manage_iptv_server_form_state.dart';
import 'form/text_input.dart';
import 'form/url_input.dart';

class ManageIptvServerItem extends ConsumerStatefulWidget {
  const ManageIptvServerItem({
    this.iptvServer,
    super.key,
  });

  final IptvServer? iptvServer;

  @override
  ConsumerState createState() => _ManageIptvServerItemState();
}

class _ManageIptvServerItemState extends ConsumerState<ManageIptvServerItem> {
  final _formKey = GlobalKey<FormState>();
  late ManageIptvServerFormState _state;
  late final TextEditingController _nameController;
  late final TextEditingController _urlController;
  late final TextEditingController _portController;
  late final TextEditingController _userController;
  late final TextEditingController _passwordController;

  void _onNameChanged() {
    setState(() {
      _state =
          _state.copyWith(name: TextInput.dirty(value: _nameController.text));
    });
  }

  void _onUrlChanged() {
    setState(() {
      _state = _state.copyWith(
        url: UrlInput.dirty(value: _urlController.text),
      );
    });
  }

  void _onPortChanged() {
    setState(() {
      _state = _state.copyWith(
        port: PortInput.dirty(value: _portController.text),
      );
    });
  }

  void _onUserChanged() {
    setState(() {
      _state = _state.copyWith(
        user: TextInput.dirty(value: _userController.text),
      );
    });
  }

  void _onPasswordChanged() {
    setState(() {
      _state = _state.copyWith(
        password: TextInput.dirty(value: _passwordController.text),
      );
    });
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _state = _state.copyWith(status: FormzSubmissionStatus.inProgress);
    });

    try {
      if (_state.id != null) {
        await ref.read(iptvServerServiceProvider).put(
              IptvServer(
                _state.name.value,
                _state.url.value,
                _state.port.value,
                _state.user.value,
                _state.password.value,
                id: _state.id!,
              ),
            );
      } else {
        await ref.read(iptvServerServiceProvider).put(
              IptvServer(
                _state.name.value,
                _state.url.value,
                _state.port.value,
                _state.user.value,
                _state.password.value,
              ),
            );
      }
      _state = _state.copyWith(status: FormzSubmissionStatus.success);
    } catch (_) {
      _state = _state.copyWith(status: FormzSubmissionStatus.failure);
    }

    if (!mounted) return;

    setState(() {});

    FocusScope.of(context)
      ..nextFocus()
      ..unfocus();

    context.pop();

    if (_state.status.isSuccess) _resetForm();
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _nameController.clear();
    _urlController.clear();
    _portController.clear();
    _userController.clear();
    _passwordController.clear();
    setState(() => _state = ManageIptvServerFormState());
  }

  @override
  void initState() {
    super.initState();
    final iptvServer = widget.iptvServer;
    _state = ManageIptvServerFormState(
      id: iptvServer?.id,
      name: TextInput.pure(value: iptvServer?.name),
      url: UrlInput.pure(value: iptvServer?.url),
      port: PortInput.pure(value: iptvServer?.port),
      user: TextInput.pure(value: iptvServer?.user),
      password: TextInput.pure(value: iptvServer?.password),
    );
    _nameController = TextEditingController(text: _state.name.value)
      ..addListener(_onNameChanged);
    _urlController = TextEditingController(text: _state.url.value)
      ..addListener(_onUrlChanged);
    _portController = TextEditingController(text: _state.port.value)
      ..addListener(_onPortChanged);
    _userController = TextEditingController(text: _state.user.value)
      ..addListener(_onUserChanged);
    _passwordController = TextEditingController(text: _state.password.value)
      ..addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return PlatformBuilder(
      macOSBuilder: (context) => MacOSMangeIptvServerWidget(
        formKey: _formKey,
        formState: _state,
        nameController: _nameController,
        urlController: _urlController,
        portController: _portController,
        userController: _userController,
        passwordController: _passwordController,
        onSubmit: _onSubmit,
      ),
      windowsBuilder: (context) => MacOSMangeIptvServerWidget(
        formKey: _formKey,
        formState: _state,
        nameController: _nameController,
        urlController: _urlController,
        portController: _portController,
        userController: _userController,
        passwordController: _passwordController,
        onSubmit: _onSubmit,
      ),
      iOSBuilder: (context) => MacOSMangeIptvServerWidget(
        formKey: _formKey,
        formState: _state,
        nameController: _nameController,
        urlController: _urlController,
        portController: _portController,
        userController: _userController,
        passwordController: _passwordController,
        onSubmit: _onSubmit,
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _urlController.dispose();
    _portController.dispose();
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
