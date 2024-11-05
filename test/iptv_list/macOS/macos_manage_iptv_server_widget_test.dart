import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iptv_player/iptv_list/form/manage_iptv_server_form_state.dart';
import 'package:iptv_player/iptv_list/form/port_input.dart';
import 'package:iptv_player/iptv_list/form/text_input.dart';
import 'package:iptv_player/iptv_list/form/url_input.dart';
import 'package:iptv_player/iptv_list/macOS/macos_mange_iptv_server_widget.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:iptv_player/shared/macos_form_text_field.dart';
import 'package:platform_builder/platform.dart';

void main() {
  group('MacOSMangeIptvServerWidget', () {
    testWidgets(
        'Should render form fields when created without filled ManageIptvServerFormState through the formState Param',
        (WidgetTester tester) async {
      Platform.init(supportedPlatforms: {Platforms.macOS, Platforms.windows});

      final formState = ManageIptvServerFormState();
      await tester.pumpWidget(MacosApp(
        home: MacOSMangeIptvServerWidget(
          formKey: GlobalKey<FormState>(),
          formState: formState,
          nameController: TextEditingController(),
          urlController: TextEditingController(),
          portController: TextEditingController(),
          userController: TextEditingController(),
          passwordController: TextEditingController(),
          onSubmit: () async {},
        ),
      ));

      expect(find.byType(MacOsFormTextField), findsNWidgets(5));
    });

    testWidgets(
        'Should pre-populate form fields when created with a filled ManageIptvServerFormState through the formState Param',
        (WidgetTester tester) async {
      Platform.init(supportedPlatforms: {Platforms.macOS, Platforms.windows});
      final formState = ManageIptvServerFormState(
        name: const TextInput.pure(value: 'Test Name'),
        url: const UrlInput.pure(value: 'http://example.com'),
        port: const PortInput.pure(value: '8080'),
        user: const TextInput.pure(value: 'admin'),
        password: const TextInput.pure(value: 'password'),
      );
      await tester.pumpWidget(MacosApp(
        home: MacOSMangeIptvServerWidget(
          formKey: GlobalKey<FormState>(),
          formState: formState,
          nameController: TextEditingController(text: 'Test Name'),
          urlController: TextEditingController(text: 'http://example.com'),
          portController: TextEditingController(text: '8080'),
          userController: TextEditingController(text: 'admin'),
          passwordController: TextEditingController(text: 'password'),
          onSubmit: () async {},
        ),
      ));

      expect(find.text('Test Name'), findsOneWidget);
      expect(find.text('http://example.com'), findsOneWidget);
      expect(find.text('8080'), findsOneWidget);
      expect(find.text('admin'), findsOneWidget);
      expect(find.text('password'), findsOneWidget);
    });

    testWidgets('Should fill the fields and submit when form is valid',
        (WidgetTester tester) async {
      Platform.init(supportedPlatforms: {Platforms.macOS, Platforms.windows});

      final formState = ManageIptvServerFormState(
        name: const TextInput.pure(value: 'Test Name'),
        url: const UrlInput.pure(value: 'http://example.com'),
        port: const PortInput.pure(value: '8080'),
        user: const TextInput.pure(value: 'admin'),
        password: const TextInput.pure(value: 'password'),
      );
      bool isSubmitted = false;
      await tester.pumpWidget(MacosApp(
        home: MacOSMangeIptvServerWidget(
          formKey: GlobalKey<FormState>(),
          formState: formState,
          nameController: TextEditingController(text: 'Test Name'),
          urlController: TextEditingController(text: 'http://example.com'),
          portController: TextEditingController(text: '8080'),
          userController: TextEditingController(text: 'admin'),
          passwordController: TextEditingController(text: 'password'),
          onSubmit: () async {
            isSubmitted = true;
          },
        ),
      ));

      await tester.tap(find.byType(MacosIconButton));
      await tester.pumpAndSettle();

      expect(isSubmitted, true);
    });
  });
}
