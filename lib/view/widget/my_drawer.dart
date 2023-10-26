import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/model/enum/extension/extension_my_route.dart';
import '/model/enum/my_route.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.house),
            iconSize: 40,
            alignment: Alignment.center,
          ),
          ListTile(
            title: const Text('Envanter'),
            onTap: () {
              Get.offNamed(MyRoute.inventoryScreen.stringDefinition);
            },
          ),
        ],
      ),
    );
  }
}
