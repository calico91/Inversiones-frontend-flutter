import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inversiones/src/ui/pages/routes/route_names.dart';

class DrawerMolecule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              headerDrawer(context),
              opciones(
                Icons.data_saver_off_sharp,
                'Reportes',
                () => Get.toNamed(RouteNames.reportes),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget headerDrawer(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 15 + MediaQuery.of(context).padding.top,
        bottom: 15,
      ),
      child: const Column(
        children: [
          CircleAvatar(
            radius: 52,
            backgroundImage: NetworkImage(
              'https://ih1.redbubble.net/image.4011562022.5678/st,small,507x507-pad,600x600,f8f8f8.jpg',
            ),
          ),
        ],
      ),
    );
  }

  Widget opciones(IconData icono, String titulo, VoidCallback accion) {
    return ListTile(
      onTap: accion,
      leading: Icon(
        icono,
        color: Colors.blue,
      ),
      title: Text(titulo),
    );
  }
}