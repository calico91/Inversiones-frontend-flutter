import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inversiones/src/ui/pages/home/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(controller.userDetails.username)),
        actions: [
          IconButton(
            onPressed: controller.logout,
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
    );
  }
}
