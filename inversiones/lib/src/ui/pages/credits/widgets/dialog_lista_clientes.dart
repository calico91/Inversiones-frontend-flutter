import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inversiones/src/domain/entities/client.dart';
import 'package:inversiones/src/ui/pages/credits/credits_controller.dart';
import 'package:inversiones/src/ui/pages/utils/general.dart';
import 'package:inversiones/src/ui/pages/widgets/inputs/text_field_search.dart';

class DialogListaClientes extends StatelessWidget {
  final CreditsController controller = Get.find<CreditsController>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AlertDialog(
          title: const Text(
            textAlign: TextAlign.center,
            'Seleccione cliente',
          ),
          content: Obx(
            () => Column(
              children: [
                TextFieldSearch(
                  controller: controller.campoBuscarCredito,
                  labelText: 'Buscar cliente',
                  onChanged: (value) => _buscarCliente(value, controller),
                ),
                SizedBox(
                  width: General.mediaQuery(context).width * 0.7,
                  height: General.mediaQuery(context).height * 0.66,
                  child: controller.listaClientes.value.isEmpty
                      ? const Center(child: Text('No hay clientes creados '))
                      : ListView.builder(
                          itemCount: controller.filtroClientes.value.length,
                          itemBuilder: (_, index) {
                            return ListTile(
                              onTap: () => _obtenerClienteSeleccionado(
                                  controller,
                                  controller.filtroClientes.value[index],
                                  context),
                              title: Text(
                                  "${controller.filtroClientes.value[index].nombres} ${controller.filtroClientes.value[index].apellidos}"),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cerrar'),
            ),
          ],
        )
      ],
    );
  }
}

void _buscarCliente(String value, CreditsController controller) {
  List<Client> results = [];
  if (value.isEmpty) {
    results = controller.listaClientes.value;
  } else {
    results = controller.listaClientes.value
        .where(
          (element) =>
              element.nombres.toLowerCase().contains(value.toLowerCase()) ||
              element.apellidos.toLowerCase().contains(value.toLowerCase()),
        )
        .toList();
  }
  controller.filtroClientes.value = results;
}

void _obtenerClienteSeleccionado(
    CreditsController controller, Client cliente, BuildContext context) {
  controller.nombreCliente.text =
      '${cliente.nombres.split(' ').first} ${cliente.apellidos}';

  print(controller.nombreCliente.text);

  controller.cedulaClienteSeleccionado(cliente.cedula);
  Navigator.pop(context);
}
