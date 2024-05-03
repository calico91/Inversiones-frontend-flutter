import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inversiones/src/ui/pages/navigation_bar/navigation_bar_controller.dart';
import 'package:inversiones/src/ui/pages/utils/general.dart';

class NavigatinBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NavigationBarController controller =
        Get.find<NavigationBarController>();
    return Scaffold(
      body: Obx(() => controller.screens[controller.indexPage.value]),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: General.mediaQuery(context).height * 0.07,
          backgroundColor: Colors.transparent,
          selectedIndex: controller.indexPage.value,
          onDestinationSelected: (index) => controller.indexPage.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'inicio'),
            NavigationDestination(icon: Icon(Icons.person), label: 'clientes'),
            NavigationDestination(icon: Icon(Icons.monetization_on), label: 'creditos'),
          ],
        ),
      ),
    );
  }
}
