import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:inversiones/src/domain/entities/roles.dart';
import 'package:inversiones/src/ui/pages/users/users_controller.dart';
import 'package:inversiones/src/ui/pages/utils/enums.dart';
import 'package:inversiones/src/ui/pages/utils/general.dart';
import 'package:inversiones/src/ui/pages/widgets/appbar/app_bar_custom.dart';
import 'package:inversiones/src/ui/pages/widgets/card/custom_card.dart';
import 'package:inversiones/src/ui/pages/widgets/inputs/text_field_base.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';

class UsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = General.mediaQuery(context);
    final UserController controller = Get.put(UserController());

    return Scaffold(
      appBar: const AppBarCustom('Usuarios'),
      body: Form(
          key: controller.formKeyUsuario,
          child: CustomCard(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Row(
                  children: [
                    TextFieldBase(
                      textAlign: TextAlign.left,
                      paddingHorizontal: 20,
                      title: 'Nombres',
                      controller: controller.nombres,
                      textInputType: TextInputType.name,
                      validateText: ValidateText.name,
                    ),
                    TextFieldBase(
                      textAlign: TextAlign.left,
                      title: 'Apellidos',
                      controller: controller.apellidos,
                      textInputType: TextInputType.name,
                      validateText: ValidateText.name,
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextFieldBase(
                      textAlign: TextAlign.left,
                      paddingHorizontal: 20,
                      title: 'Nombre usuario',
                      controller: controller.nombreUsuario,
                      textInputType: TextInputType.name,
                      validateText: ValidateText.name,
                    ),
                    TextFieldBase(
                      textAlign: TextAlign.left,
                      title: 'Correo',
                      controller: controller.correo,
                      textInputType: TextInputType.emailAddress,
                      validateText: ValidateText.email,
                    ),
                  ],
                ),
                Row(
                  children: [
                    _selectRoles(mediaQuery, controller),
                    Container(
                      color: Colors.amber,
                      child: Padding(
                          padding: EdgeInsets.only(
                              bottom: mediaQuery.height * 0.08,
                              left: mediaQuery.width * 0.04),
                          child: FilledButton.icon(
                              onPressed: () {},
                              icon: const FaIcon(FontAwesomeIcons.userCheck),
                              label: const Text("Registrar"))),
                    )
                  ],
                )
              ]))),
    );
  }
}

Widget _selectRoles(Size mediaQuery, UserController controller) {
  final RxBool cargando = controller.rolesController.cargando;
  return Obx(() => Container(
    color: Colors.amber,
      padding: EdgeInsets.symmetric(
          horizontal: mediaQuery.width * 0.05,
          vertical: mediaQuery.height * 0.02),
      height:
          !cargando.value ? mediaQuery.height * 0.18 : mediaQuery.height * 0.05,
      width: mediaQuery.width * 0.5,
      child: !cargando.value
          ? MultiSelectDialogField(
              dialogHeight: mediaQuery.height * (controller.items.length / 11),
              chipDisplay: MultiSelectChipDisplay<Roles>(scroll: true),
              buttonIcon: const Icon(Icons.arrow_forward_ios_rounded),
              selectedColor: Colors.blue,
              buttonText: const Text('Roles', textAlign: TextAlign.center),
              title: const Center(child: Text("Seleccione roles")),
              items: controller.items,
              onConfirm: (items) {})
          : const LinearProgressIndicator()));
}
