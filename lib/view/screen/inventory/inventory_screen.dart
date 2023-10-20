import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stok_takibi_masaustu/view/constant/padding.dart';
import 'package:stok_takibi_masaustu/view/get_controller/theme_controller.dart';
import 'package:stok_takibi_masaustu/view/widget/my_app_bar.dart';

class InventoryScreen extends StatelessWidget {
  InventoryScreen({super.key});

  final _themeController = Get.find<ThemeController>();
  final BorderRadius borderRadius = BorderRadius.circular(25);

  @override
  Widget build(BuildContext context) {
    return buildScaffold();
  }

  Scaffold buildScaffold() {
    return Scaffold(
      appBar: myAppBar('Inventory'),
      body: buildBody(),
    );
  }

  Column buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: buildDataTableRow()),
      ],
    );
  }

  Row buildDataTableRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: dataTablePadding,
            child: buildDataTableContainer(),
          ),
        ),
      ],
    );
  }

  Obx buildDataTableContainer() {
    return Obx(
          () => Container(
        decoration: BoxDecoration(
          color: _themeController.dataTableContainerColor.value,
          borderRadius: borderRadius,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ClipRRect(
            borderRadius: borderRadius,
            child: buildDataTable(),
          ),
        ),
      ),
    );
  }

  DataTable buildDataTable() {
    return DataTable(
      showCheckboxColumn: false,
      border: const TableBorder(
        horizontalInside: BorderSide(
          width: 0.5,
          color: Colors.white,
        ),
        verticalInside: BorderSide(
          width: 0.6,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      columns: const [
        DataColumn(label: Text('Barcode', style: TextStyle(color: Colors.white, fontSize: 22))),
        DataColumn(label: Text('Name', style: TextStyle(color: Colors.white, fontSize: 22))),
        DataColumn(label: Text('Description', style: TextStyle(color: Colors.white, fontSize: 22))),
        DataColumn(label: Text('Price', style: TextStyle(color: Colors.white, fontSize: 22))),
        DataColumn(label: Text('Quantity', style: TextStyle(color: Colors.white, fontSize: 22))),
      ],
      rows: [
        DataRow(
          cells: const [
            DataCell(Text('123456789', style: TextStyle(color: Colors.white, fontSize: 20))),
            DataCell(Text('Şarj Aleti', style: TextStyle(color: Colors.white, fontSize: 20))),
            DataCell(Text('Xiomi 17Kb', style: TextStyle(color: Colors.white, fontSize: 20))),
            DataCell(Text('85', style: TextStyle(color: Colors.white, fontSize: 20))),
            DataCell(Text('45', style: TextStyle(color: Colors.white, fontSize: 20))),
          ],
          onSelectChanged: (selected) {},
        ),
        const DataRow(cells: [
          DataCell(Text('234567891')),
          DataCell(Text('Power Bank')),
          DataCell(Text('Samsung Ldb')),
          DataCell(Text('1750')),
          DataCell(Text('12')),
        ]),
        const DataRow(cells: [
          DataCell(Text('345678912')),
          DataCell(Text('Kulaklık')),
          DataCell(Text('Apple Airpods')),
          DataCell(Text('1250')),
          DataCell(Text('5')),
        ]),
        const DataRow(cells: [
          DataCell(Text('345678912')),
          DataCell(Text('Kulaklık')),
          DataCell(Text('Apple Airpods')),
          DataCell(Text('1250')),
          DataCell(Text('5')),
        ]),
        const DataRow(cells: [
          DataCell(Text('345678912')),
          DataCell(Text('Kulaklık')),
          DataCell(Text('Apple Airpods')),
          DataCell(Text('1250')),
          DataCell(Text('5')),
        ]),
        const DataRow(cells: [
          DataCell(Text('345678912')),
          DataCell(Text('Kulaklık')),
          DataCell(Text('Apple Airpods')),
          DataCell(Text('1250')),
          DataCell(Text('5')),
        ]),
        const DataRow(cells: [
          DataCell(Text('345678912')),
          DataCell(Text('Kulaklık')),
          DataCell(Text('Apple Airpods')),
          DataCell(Text('1250')),
          DataCell(Text('5')),
        ]),
        const DataRow(cells: [
          DataCell(Text('345678912')),
          DataCell(Text('Kulaklık')),
          DataCell(Text('Apple Airpods')),
          DataCell(Text('1250')),
          DataCell(Text('5')),
        ]),
        const DataRow(cells: [
          DataCell(Text('345678912')),
          DataCell(Text('Kulaklık')),
          DataCell(Text('Apple Airpods')),
          DataCell(Text('1250')),
          DataCell(Text('5')),
        ]),
        const DataRow(cells: [
          DataCell(Text('345678912')),
          DataCell(Text('Kulaklık')),
          DataCell(Text('Apple Airpods')),
          DataCell(Text('1250')),
          DataCell(Text('5')),
        ]),
        const DataRow(cells: [
          DataCell(Text('345678912')),
          DataCell(Text('Kulaklık')),
          DataCell(Text('Apple Airpods')),
          DataCell(Text('1250')),
          DataCell(Text('5')),
        ]),
        const DataRow(cells: [
          DataCell(Text('345678912')),
          DataCell(Text('Kulaklık')),
          DataCell(Text('Apple Airpods')),
          DataCell(Text('1250')),
          DataCell(Text('5')),
        ]),
        const DataRow(cells: [
          DataCell(Text('345678912')),
          DataCell(Text('Kulaklık')),
          DataCell(Text('Apple Airpods')),
          DataCell(Text('1250')),
          DataCell(Text('5')),
        ]),
        const DataRow(cells: [
          DataCell(Text('345678912')),
          DataCell(Text('Kulaklık')),
          DataCell(Text('Apple Airpods')),
          DataCell(Text('1250')),
          DataCell(Text('5')),
        ]),
        const DataRow(cells: [
          DataCell(Text('345678912')),
          DataCell(Text('Kulaklık')),
          DataCell(Text('Apple Airpods')),
          DataCell(Text('1250')),
          DataCell(Text('5')),
        ]),
        const DataRow(cells: [
          DataCell(Text('345678912')),
          DataCell(Text('Kulaklık')),
          DataCell(Text('Apple Airpods')),
          DataCell(Text('1250')),
          DataCell(Text('5')),
        ]),
      ],
    );
  }
}
