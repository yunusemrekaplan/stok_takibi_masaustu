import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stok_takibi_masaustu/view/constant/padding.dart';
import 'package:stok_takibi_masaustu/view/constant/string.dart';
import 'package:stok_takibi_masaustu/view/get_controller/theme_controller.dart';
import 'package:stok_takibi_masaustu/view/widget/my_app_bar.dart';

class InventoryScreen extends StatelessWidget {
  InventoryScreen({super.key});

  final _themeController = Get.find<ThemeController>();
  final BorderRadius borderRadius = BorderRadius.circular(25);

  final double borderSideWith = 0.7;
  final Color borderSideColor = Colors.white;
  final Axis dataTableScrollDirection = Axis.vertical;
  final bool showCheckboxColumn = false;

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
          scrollDirection: dataTableScrollDirection,
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
      showCheckboxColumn: showCheckboxColumn,
      border: buildTableBorder(),
      columns: buildColumns(),
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

  List<DataColumn> buildColumns() {
    return const [
      DataColumn(label: Text(barcode)),
      DataColumn(label: Text(name)),
      DataColumn(label: Text(description)),
      DataColumn(label: Text(price), numeric: true),
      DataColumn(label: Text(quantity), numeric: true),
    ];
  }

  TableBorder buildTableBorder() {
    return TableBorder(
      horizontalInside: BorderSide(
        width: borderSideWith,
        color: borderSideColor,
      ),
      verticalInside: BorderSide(
        width: borderSideWith,
        color: borderSideColor,
      ),
      borderRadius: borderRadius,
    );
  }
}
