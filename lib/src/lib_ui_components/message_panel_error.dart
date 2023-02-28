import 'package:flutter/widgets.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:rx_bloc/rx_bloc.dart';

import '../base/models/errors/error_model.dart';
import '../base/models/message_panel_state.dart';
import 'message_panel_widget.dart';

typedef ErrorStateCallback<BlocType extends RxBlocTypeBase>
    = Stream<ErrorModel?> Function(BlocType bloc);

class MessagePanelError<BlocType extends RxBlocTypeBase>
    extends StatelessWidget {
  const MessagePanelError({
    required this.errorState,
    this.bloc,
    this.errorPanelIcon,
    this.padding = EdgeInsets.zero,
    this.errorBuilder,
    this.messageState = MessagePanelState.important,
    Key? key,
  }) : super(key: key);

  final BlocType? bloc;
  final ErrorStateCallback<BlocType> errorState;
  final EdgeInsets padding;
  final Widget Function(ErrorModel?)? errorBuilder;
  final MessagePanelState messageState;
  final dynamic errorPanelIcon;

  @override
  Widget build(BuildContext context) => RxBlocBuilder<BlocType, ErrorModel?>(
        bloc: bloc,
        state: (bloc) => errorState(bloc),
        builder: (context, snapshot, bloc) => AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: snapshot.data == null
              ? const SizedBox()
              : Padding(
                  padding: padding,
                  child: errorBuilder?.call(snapshot.data) ??
                      MessagePanelWidget(
                        message: snapshot.data.toString(),
                        messageState: messageState,
                        errorPanelIcon: errorPanelIcon,
                      ),
                ),
        ),
      );
}
