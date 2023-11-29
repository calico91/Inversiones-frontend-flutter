import 'package:flutter/material.dart';
import 'package:inversiones/src/ui/pages/utils/general.dart';
import 'package:screenshot/screenshot.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    required this.screenshotController,
    required this.nombreArchivo,
  });

  final ScreenshotController screenshotController;
  final String nombreArchivo;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _compartirImagen(),
      icon: const Icon(
        Icons.share,
        color: Colors.blue,
      ),
    );
  }

  Future<void> _compartirImagen() async {
    final image = await screenshotController.capture(
      delay: const Duration(seconds: 2),
    );
    if (image == null) return;
    await General.capturarGardarImagen(image);
    General.compartirImagen(image, nombreArchivo);
  }
}
