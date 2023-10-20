import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inversiones/src/ui/pages/home/home_controller.dart';
import 'package:inversiones/src/ui/pages/home/widgets/all_clients_molecule.dart';
import 'package:inversiones/src/ui/pages/home/widgets/simulate_credit_molecule.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final HomeController controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title:
            Center(child: Text(controller.userDetails.username.toUpperCase())),
        actions: [
          IconButton(
            onPressed: controller.logout,
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: size.height * 0.3,
                child: const AllClientsMolecule(),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.person),
                    label: const Text("Clientes"),
                  ),
                  FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.monetization_on_outlined),
                    label: const Text("Creditos"),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SimulateCreditMolecule(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
