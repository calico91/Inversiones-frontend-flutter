import 'package:flutter/material.dart';
import 'package:inversiones/src/ui/pages/widgets/buttons/close_button_custom.dart';
import 'package:inversiones/src/ui/pages/widgets/buttons/home_button.dart';

class DialogEstadoCredito extends StatelessWidget {
  const DialogEstadoCredito({required this.info});
  final String info;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      actionsPadding: EdgeInsets.zero,
      title: const Text(
        textAlign: TextAlign.center,
        'Informacion estado credito',
      ),
      content: Text(info),
      actions: [HomeButton(), CloseButtonCustom()],
    );
  }
}
