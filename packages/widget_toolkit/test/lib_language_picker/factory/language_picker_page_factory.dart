import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_toolkit/language_picker.dart';

import '../../mocks/stubs.dart';
import '../services/language_picker_service_mock.dart';

Widget languagePickerSuccessPageFactory({
  required bool showError,
  required bool isLoading,
}) =>
    Scaffold(
      body: MultiProvider(
        providers: [
          Provider<LanguagePickerServiceMock>(
            create: (context) => LanguagePickerServiceMock(
              languages: [
                Stubs.selectedLanguageEnglish,
                Stubs.selectedLanguageBulgarian
              ],
              selected: Stubs.selectedLanguageEnglish,
            ),
          ),
        ],
        child: Builder(
          builder: (context) => ChangeLanguageWidget(
            messageState: MessagePanelState.important,
            service: context.read<LanguagePickerServiceMock>(),
            onChanged: (language){
            },
          ),
        ),
      ),
    );
