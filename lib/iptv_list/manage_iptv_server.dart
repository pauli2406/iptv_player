import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:play_shift/iptv_list/form/port_input.dart';
import 'package:play_shift/iptv_list/windows/windows_manage_iptv_server_widget.dart';
import 'package:play_shift/provider/isar/iptv_server_provider.dart';

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
  late final TextEditingController _nameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _portController;
  final ValueNotifier<ManageIptvServerFormState> _stateNotifier =
      ValueNotifier(ManageIptvServerFormState());

  late final TextEditingController _urlController;
  late final TextEditingController _userController;

  @override
  void dispose() {
    _nameController.dispose();
    _urlController.dispose();
    _portController.dispose();
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final iptvServer = widget.iptvServer;
    _stateNotifier.value = ManageIptvServerFormState(
      id: iptvServer?.id,
      name: TextInput.pure(value: iptvServer?.name),
      url: UrlInput.pure(value: iptvServer?.url),
      port: PortInput.pure(value: iptvServer?.port),
      user: TextInput.pure(value: iptvServer?.user),
      password: TextInput.pure(value: iptvServer?.password),
    );
    _nameController =
        TextEditingController(text: _stateNotifier.value.name.value)
          ..addListener(_onNameChanged);
    _urlController = TextEditingController(text: _stateNotifier.value.url.value)
      ..addListener(_onUrlChanged);
    _portController =
        TextEditingController(text: _stateNotifier.value.port.value)
          ..addListener(_onPortChanged);
    _userController =
        TextEditingController(text: _stateNotifier.value.user.value)
          ..addListener(_onUserChanged);
    _passwordController =
        TextEditingController(text: _stateNotifier.value.password.value)
          ..addListener(_onPasswordChanged);
  }

  void _onNameChanged() {
    setState(() {
      _stateNotifier.value = _stateNotifier.value
          .copyWith(name: TextInput.dirty(value: _nameController.text));
    });
  }

  void _onUrlChanged() {
    setState(() {
      _stateNotifier.value = _stateNotifier.value.copyWith(
        url: UrlInput.dirty(value: _urlController.text),
      );
    });
  }

  void _onPortChanged() {
    setState(() {
      _stateNotifier.value = _stateNotifier.value.copyWith(
        port: PortInput.dirty(value: _portController.text),
      );
    });
  }

  void _onUserChanged() {
    setState(() {
      _stateNotifier.value = _stateNotifier.value.copyWith(
        user: TextInput.dirty(value: _userController.text),
      );
    });
  }

  void _onPasswordChanged() {
    setState(() {
      _stateNotifier.value = _stateNotifier.value.copyWith(
        password: TextInput.dirty(value: _passwordController.text),
      );
    });
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    _stateNotifier.value =
        _stateNotifier.value.copyWith(status: FormzSubmissionStatus.inProgress);

    try {
      if (_stateNotifier.value.id != null) {
        await ref.read(iptvServerServiceProvider).put(
              IptvServer(
                _stateNotifier.value.name.value,
                _stateNotifier.value.url.value,
                _stateNotifier.value.port.value,
                _stateNotifier.value.user.value,
                _stateNotifier.value.password.value,
                id: _stateNotifier.value.id!,
              ),
            );
      } else {
        await ref.read(iptvServerServiceProvider).put(
              IptvServer(
                _stateNotifier.value.name.value,
                _stateNotifier.value.url.value,
                _stateNotifier.value.port.value,
                _stateNotifier.value.user.value,
                _stateNotifier.value.password.value,
              ),
            );
      }
      _stateNotifier.value =
          _stateNotifier.value.copyWith(status: FormzSubmissionStatus.success);
    } catch (_) {
      _stateNotifier.value =
          _stateNotifier.value.copyWith(status: FormzSubmissionStatus.failure);
    }

    if (!mounted) return;

    FocusScope.of(context)
      ..nextFocus()
      ..unfocus();

    context.router.maybePop();

    if (_stateNotifier.value.status.isSuccess) _resetForm();
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _nameController.clear();
    _urlController.clear();
    _portController.clear();
    _userController.clear();
    _passwordController.clear();
    setState(() => _stateNotifier.value = ManageIptvServerFormState());
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ManageIptvServerFormState>(
      valueListenable: _stateNotifier,
      builder: (context, state, child) {
        return WindowsManageIptvServerWidget(
          formKey: _formKey,
          formState: state,
          nameController: _nameController,
          urlController: _urlController,
          portController: _portController,
          userController: _userController,
          passwordController: _passwordController,
          onSubmit: _onSubmit,
        );
      },
    );
  }
}
