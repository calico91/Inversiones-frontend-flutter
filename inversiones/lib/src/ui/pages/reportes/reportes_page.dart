import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inversiones/src/domain/responses/reportes/reporte_interes_capital_response.dart';
import 'package:inversiones/src/ui/pages/reportes/reportes_controller.dart';
import 'package:inversiones/src/ui/pages/utils/general.dart';
import 'package:inversiones/src/ui/pages/widgets/card/custom_card.dart';
import 'package:inversiones/src/ui/pages/widgets/inputs/text_field_calendar.dart';

class ReportesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ReportesController controller = Get.find<ReportesController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Reportes'),
      ),
      body: SizedBox(
      height: General.mediaQuery(context).height*0.23,
        child: CustomCard(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Informacion capital interes',
                    style: TextStyle(fontSize: 20),
                  ),
                  IconButton(
                    tooltip: 'Consultar informacion',
                    onPressed: () => controller
                        .consultarCapitalInteres(General.mediaQuery(context)),
                    icon: const Icon(
                      Icons.info,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextFieldCalendar(
                    controller: controller.fechaInicial,
                    onTap: () async =>
                        General.showCalendar(context, controller.fechaInicial),
                    title: 'Fecha inicial',
                  ),
                  TextFieldCalendar(
                    controller: controller.fechaFinal,
                    onTap: () async =>
                        General.showCalendar(context, controller.fechaFinal),
                    title: 'Fecha final',
                  ),
                ],
              ),
              Obx(
                () => !controller.fechasCorrectas.value
                    ? _mensajeFechasError()
                    : _informacionCapitalInteres(
                        controller.infoInteresCapital.value,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _mensajeFechasError() {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text(
        'Revise las fechas de consulta',
        style: TextStyle(color: Colors.red.shade900),
      ),
    );
  }

  Widget _informacionCapitalInteres(ReporteInteresyCapital info) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Text(
              'Interes',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              General.formatoMoneda(info.interesMes ?? 0),
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
        Column(
          children: [
            const Text('Capital', style: TextStyle(fontSize: 20)),
            Text(
              General.formatoMoneda(info.capitalMes ?? 0),
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }
}
