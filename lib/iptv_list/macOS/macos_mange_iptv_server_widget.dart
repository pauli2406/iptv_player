import 'package:flutter/cupertino.dart';
import 'package:iptv_player/shared/macos_form_text_field.dart';
import 'package:macos_ui/macos_ui.dart';

import '../form/manage_iptv_server_form_state.dart';
import '../form/text_input.dart';
import '../form/url_input.dart';
import '../form/port_input.dart';

class MacOSMangeIptvServerWidget extends StatelessWidget {
  const MacOSMangeIptvServerWidget({
    super.key,
    required this.formKey,
    required this.formState,
    required this.nameController,
    required this.urlController,
    required this.portController,
    required this.userController,
    required this.passwordController,
    required this.onSubmit,
  });

  final GlobalKey<FormState> formKey;
  final ManageIptvServerFormState formState;
  final TextEditingController nameController;
  final TextEditingController urlController;
  final TextEditingController portController;
  final TextEditingController userController;
  final TextEditingController passwordController;
  final Future<void> Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
      backgroundColor: MacosColors.appleCyan,
      toolBar: _buildToolBar(context),
      children: [
        ContentArea(
          builder: (context, scrollController) {
            return _buildContentArea(context);
          },
        ),
      ],
    );
  }

  ToolBar _buildToolBar(BuildContext context) {
    return ToolBar(
      decoration: BoxDecoration(color: MacosTheme.of(context).canvasColor),
      title: const Text('Create new IPTV-Server'),
      titleWidth: 200,
    );
  }

  Widget _buildContentArea(BuildContext context) {
    return Container(
      color: MacosTheme.of(context).canvasColor,
      child: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 400,
            child: _buildForm(),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIcon(),
          const SizedBox(height: 60),
          _buildFormFields(),
          _buildSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return const MacosIcon(
      CupertinoIcons.add,
      size: 90,
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        _buildTextFormField(
          controller: nameController,
          placeholder: 'Name',
          label: 'Add your XTream Codes IPTV-Server:',
          textInput: formState.name,
          key: const Key('name_form_field'),
        ),
        _buildUrlFormField(
          controller: urlController,
          placeholder: 'Host',
          label: 'Host (e.g. http://example.com)',
          urlInput: formState.url,
          key: const Key('url_form_field'),
        ),
        _buildPortFormField(
          controller: portController,
          placeholder: 'Port',
          label: 'Port (e.g. 8080)',
          portInput: formState.port,
          key: const Key('port_form_field'),
        ),
        _buildTextFormField(
          controller: userController,
          placeholder: 'Username',
          label: 'Username (e.g. admin)',
          textInput: formState.user,
          key: const Key('username_form_field'),
        ),
        _buildTextFormField(
          controller: passwordController,
          placeholder: 'Password',
          label: 'Password',
          textInput: formState.password,
          key: const Key('password_form_field'),
        ),
      ],
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String placeholder,
    required String label,
    required TextInput textInput,
    Key? key,
  }) {
    return Column(
      key: key,
      children: [
        const SizedBox(height: 10),
        Text(label),
        MacOsFormTextField(
          controller: controller,
          placeholder: placeholder,
          showError:
              textInput.isPure || (!textInput.isPure && textInput.isValid),
          errorText: textInput.displayError?.text(),
        ),
      ],
    );
  }

  Widget _buildUrlFormField({
    required TextEditingController controller,
    required String placeholder,
    required String label,
    required UrlInput urlInput,
    Key? key,
  }) {
    return Column(
      key: key,
      children: [
        const SizedBox(height: 10),
        Text(label),
        MacOsFormTextField(
          controller: controller,
          placeholder: placeholder,
          showError: urlInput.isPure || (!urlInput.isPure && urlInput.isValid),
          errorText: urlInput.displayError?.text(),
        ),
      ],
    );
  }

  Widget _buildPortFormField({
    required TextEditingController controller,
    required String placeholder,
    required String label,
    required PortInput portInput,
    Key? key,
  }) {
    return Column(
      key: key,
      children: [
        const SizedBox(height: 10),
        Text(label),
        MacOsFormTextField(
          controller: controller,
          placeholder: placeholder,
          showError:
              portInput.isPure || (!portInput.isPure && portInput.isValid),
          errorText: portInput.displayError?.text(),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return MacosIconButton(
      key: const Key('submit_button'),
      icon: Icon(
        CupertinoIcons.arrow_right_circle_fill,
        color: formState.isNotValid ? CupertinoColors.inactiveGray : null,
        size: 30,
      ),
      boxConstraints: BoxConstraints.tight(const Size.square(60)),
      shape: BoxShape.circle,
      disabledColor: CupertinoColors.lightBackgroundGray,
      onPressed: formState.isValid ? () => onSubmit() : null,
    );
  }
}
