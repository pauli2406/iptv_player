import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '../form/manage_iptv_server_form_state.dart';
import '../form/text_input.dart';
import '../form/url_input.dart';
import '../form/port_input.dart';

class WindowsManageIptvServerWidget extends StatelessWidget {
  const WindowsManageIptvServerWidget({
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
    return NavigationView(
      appBar: const NavigationAppBar(
        title: Text('Create new IPTV-Server'),
      ),
      content: _buildContentArea(context),
    );
  }

  Widget _buildContentArea(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 800,
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
          const SizedBox(height: 30),
          _buildSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return const Icon(
      Icons.add,
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
          obscureText: true,
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
    bool obscureText = false,
    Key? key,
  }) {
    return Column(
      key: key,
      children: [
        const SizedBox(height: 10),
        Text(label),
        TextBox(
          controller: controller,
          placeholder: placeholder,
          obscureText: obscureText,

          // errorText: textInput.displayError?.text(),
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
        TextBox(
          controller: controller,
          placeholder: placeholder,
          // errorText: urlInput.displayError?.text(),
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
        TextBox(
          controller: controller,
          placeholder: placeholder,
          // errorText: portInput.displayError?.text(),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Button(
      key: const Key('submit_button'),
      onPressed: formState.isValid ? () => onSubmit() : null,
      child: const Text('Submit'),
    );
  }
}
