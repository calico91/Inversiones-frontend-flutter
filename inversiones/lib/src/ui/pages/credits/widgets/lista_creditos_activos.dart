import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inversiones/src/ui/pages/credits/credits_controller.dart';
import 'package:inversiones/src/ui/pages/home/home_controller.dart';
import 'package:inversiones/src/ui/pages/utils/constantes.dart';
import 'package:inversiones/src/ui/pages/utils/general.dart';
import 'package:inversiones/src/ui/pages/widgets/card/custom_card.dart';
import 'package:inversiones/src/ui/pages/widgets/inputs/text_field_search.dart';

class ListaCreditosActivos extends StatelessWidget {
  const ListaCreditosActivos({super.key});
  @override
  Widget build(BuildContext context) {
    final CreditsController controller = Get.find<CreditsController>();
    final HomeController homeController = Get.find<HomeController>();
    return Obx(() {
      if (controller.creditosActivos.value.isEmpty) {
        
        return Padding(
          padding: EdgeInsets.symmetric(
              vertical: General.mediaQuery(context).height * 0.2,
              horizontal: General.mediaQuery(context).height * 0.15),
          child: Visibility(
            visible: homeController.mostrarModulo(['ADMIN']),
            child: FilledButton.icon(
                icon: const Icon(Icons.list),
                label: const Text('Creditos'),
                onPressed: () => controller.infoCreditosActivos()),
          ),
        );
      }
      return CustomCard(
        child: Column(
          children: [
            SizedBox(
              height: General.mediaQuery(context).height * 0.39,
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: General.mediaQuery(context).width * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: General.mediaQuery(context).width * 0.68,
                          child: TextFieldSearch(
                            controller: controller.campoBuscarCliente,
                            labelText:
                                'Buscar credito ${controller.creditosActivos.value.length}',
                            onChanged: (value) =>
                                controller.buscarCredito(value),
                          ),
                        ),
                        IconButton(
                          onPressed: () => controller.infoCreditosActivos(),
                          icon: const Icon(Icons.refresh),
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ),
                  _listaClientes(
                    controller,
                    General.mediaQuery(context),
                    context,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _listaClientes(
    CreditsController controller,
    Size size,
    BuildContext context,
  ) {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.filtroCreditos.value.length,
        itemBuilder: (_, index) {
          return Card(
            child: ListTile(
              title: _showClientTitle(controller, index, size),
              subtitle: _informacionSubtitulo(controller, index, context),
            ),
          );
        },
      ),
    );
  }

  Widget _showClientTitle(CreditsController controller, int index, Size size) {
    return SizedBox(
      width: size.width * 0.47,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size.width * 0.5,
            child: Text(
              overflow: TextOverflow.ellipsis,
              "${controller.filtroCreditos.value[index].idCredito}.${controller.filtroCreditos.value[index].nombres} ${controller.filtroCreditos.value[index].apellidos}",
            ),
          ),
          Text(
            "${General.formatoMoneda(controller.filtroCreditos.value[index].valorCredito)} ",
          ),
        ],
      ),
    );
  }

  Widget _informacionSubtitulo(
    CreditsController controller,
    int index,
    BuildContext context,
  ) {
    return Row(
      children: [
        Text(
          'Fecha credito: ${controller.filtroCreditos.value[index].fechaCredito}',
        ),
        const Expanded(child: SizedBox()),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              tooltip: Constantes.INFORMACION_CREDITO,
              onPressed: () {
                controller.infoCreditoySaldo(
                    controller.filtroCreditos.value[index].idCredito!);
                FocusScope.of(context).requestFocus(FocusNode());
              },
              icon: const Icon(Icons.info),
              color: Colors.blue,
              iconSize: 32,
            ),
            IconButton(
              tooltip: 'Informacion abonos',
              onPressed: () {
                controller.consultarAbonosRealizados(
                    controller.filtroCreditos.value[index].idCredito!);
                FocusScope.of(context).requestFocus(FocusNode());
              },
              icon: const Icon(
                Icons.document_scanner_outlined,
                color: Colors.blue,
              ),
              iconSize: 32,
            ),
          ],
        ),
      ],
    );
  }
}
