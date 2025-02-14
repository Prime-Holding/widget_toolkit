import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:widget_toolkit/src/base/models/message_panel_state.dart';

import '../../helpers/golden_helper.dart';
import '../../mocks/stubs.dart';
import '../factory/message_panel_widget_factory.dart';

void main() {
  runGoldenBuilderTests('message_panel_widget_golden_tests',
      surfaceSize: const Size(900, 600),
      matcherCustomPump: (widget) =>
          widget.pump(const Duration(milliseconds: 350)),
      builder: GoldenBuilder.grid(
        bgColor: Colors.blue,
        columns: 4,
        widthToHeightRatio: 1,
      )
        ..addScenario(
          'important',
          messagePanelWidgetFactory(
            state: MessagePanelState.important,
            message: Stubs.messagePanelText,
          ),
        )
        ..addScenario(
          'important loading',
          messagePanelWidgetFactory(
            state: MessagePanelState.important,
            message: Stubs.messagePanelText,
            isLoading: true,
          ),
        )
        ..addScenario(
          'informative',
          messagePanelWidgetFactory(
            state: MessagePanelState.informative,
            message: Stubs.messagePanelText,
          ),
        )
        ..addScenario(
          'informative loading',
          messagePanelWidgetFactory(
            state: MessagePanelState.informative,
            message: Stubs.messagePanelText,
            isLoading: true,
          ),
        )
        ..addScenario(
          'lessImportant',
          messagePanelWidgetFactory(
            state: MessagePanelState.lessImportant,
            message: Stubs.messagePanelText,
          ),
        )
        ..addScenario(
          'lessImportant loading',
          messagePanelWidgetFactory(
            state: MessagePanelState.lessImportant,
            message: Stubs.messagePanelText,
            isLoading: true,
          ),
        )
        ..addScenario(
          'neutral',
          messagePanelWidgetFactory(
            state: MessagePanelState.neutral,
            message: Stubs.messagePanelText,
          ),
        )
        ..addScenario(
          'neutral loading',
          messagePanelWidgetFactory(
            state: MessagePanelState.neutral,
            message: Stubs.messagePanelText,
            isLoading: true,
          ),
        )
        ..addScenario(
          'positive',
          messagePanelWidgetFactory(
            state: MessagePanelState.positive,
            message: Stubs.messagePanelText,
          ),
        )
        ..addScenario(
          'positive loading',
          messagePanelWidgetFactory(
            state: MessagePanelState.positive,
            message: Stubs.messagePanelText,
            isLoading: true,
          ),
        )
        ..addScenario(
          'positiveCheck',
          messagePanelWidgetFactory(
            state: MessagePanelState.positiveCheck,
            message: Stubs.messagePanelText,
          ),
        )
        ..addScenario(
          'positiveCheck loading',
          messagePanelWidgetFactory(
            state: MessagePanelState.positiveCheck,
            message: Stubs.messagePanelText,
            isLoading: true,
          ),
        )
        ..addScenario(
          'custom',
          messagePanelWidgetFactory(
            state: MessagePanelState.custom,
            message: Stubs.messagePanelText,
            errorPanelIcon: const Icon(Icons.backspace_outlined),
          ),
        )
        ..addScenario(
          'custom loading',
          messagePanelWidgetFactory(
            state: MessagePanelState.custom,
            message: Stubs.messagePanelText,
            isLoading: true,
            errorPanelIcon: const Icon(Icons.backspace_outlined),
          ),
        ));
}
