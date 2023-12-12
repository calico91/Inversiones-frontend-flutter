import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uuid/uuid.dart';

class General {
  const General();

  static String formatoMoneda(dynamic value) {
    final NumberFormat response = NumberFormat("\$#,##0", "es_CO");
    return response.format(value);
  }

  static String formatoFecha(DateTime date) =>
      DateFormat('yyyy-MM-dd').format(date);

      ///formatea fecha

  ///quita las comas del string que viene del input
  static double stringToDouble(String value) =>
      double.parse(value.replaceAll(',', '').trim());

  ///mediaQuery
  static Size mediaQuery(BuildContext context) => MediaQuery.of(context).size;

  static Future<dynamic> capturarGardarImagen(Uint8List image) async {
    await [Permission.storage].request();
    final random = const Uuid().v1();
    final String name = 'screenshot$random';
    final result = await ImageGallerySaver.saveImage(image, name: name);
    // ignore: avoid_dynamic_calls
    return result['filePaht'];
  }

  static Future compartirImagen(Uint8List bytes, String titulo) async {
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/comprobante.jpg');
    image.writeAsBytesSync(bytes);

    await Share.shareXFiles(
      [XFile(image.path)],
      text: titulo,
    );
  }

  static Future<void> showCalendar(
    BuildContext context,
    TextEditingController controllerField, [
    DateTime? initialDate,
    DateTime? firstDate,
  ]) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(2023),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null) {
      controllerField.text = formatoFecha(pickedDate);
    }
  }
}
