import 'package:flutter/material.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
      ),
      body: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Barcode')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Description')),
                  DataColumn(label: Text('Price')),
                  DataColumn(label: Text('Quantity')),
                ],
                rows: const [
                  DataRow(cells: [
                    DataCell(Text('123456789')),
                    DataCell(Text('Şarj Aleti')),
                    DataCell(Text('Xiomi 17Kb')),
                    DataCell(Text('85')),
                    DataCell(Text('45')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('234567891')),
                    DataCell(Text('Power Bank')),
                    DataCell(Text('Samsung Ldb')),
                    DataCell(Text('1750')),
                    DataCell(Text('12')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('345678912')),
                    DataCell(Text('Kulaklık')),
                    DataCell(Text('Apple Airpods')),
                    DataCell(Text('1250')),
                    DataCell(Text('5')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('345678912')),
                    DataCell(Text('Kulaklık')),
                    DataCell(Text('Apple Airpods')),
                    DataCell(Text('1250')),
                    DataCell(Text('5')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('345678912')),
                    DataCell(Text('Kulaklık')),
                    DataCell(Text('Apple Airpods')),
                    DataCell(Text('1250')),
                    DataCell(Text('5')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('345678912')),
                    DataCell(Text('Kulaklık')),
                    DataCell(Text('Apple Airpods')),
                    DataCell(Text('1250')),
                    DataCell(Text('5')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('345678912')),
                    DataCell(Text('Kulaklık')),
                    DataCell(Text('Apple Airpods')),
                    DataCell(Text('1250')),
                    DataCell(Text('5')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('345678912')),
                    DataCell(Text('Kulaklık')),
                    DataCell(Text('Apple Airpods')),
                    DataCell(Text('1250')),
                    DataCell(Text('5')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('345678912')),
                    DataCell(Text('Kulaklık')),
                    DataCell(Text('Apple Airpods')),
                    DataCell(Text('1250')),
                    DataCell(Text('5')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('345678912')),
                    DataCell(Text('Kulaklık')),
                    DataCell(Text('Apple Airpods')),
                    DataCell(Text('1250')),
                    DataCell(Text('5')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('345678912')),
                    DataCell(Text('Kulaklık')),
                    DataCell(Text('Apple Airpods')),
                    DataCell(Text('1250')),
                    DataCell(Text('5')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('345678912')),
                    DataCell(Text('Kulaklık')),
                    DataCell(Text('Apple Airpods')),
                    DataCell(Text('1250')),
                    DataCell(Text('5')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('345678912')),
                    DataCell(Text('Kulaklık')),
                    DataCell(Text('Apple Airpods')),
                    DataCell(Text('1250')),
                    DataCell(Text('5')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('345678912')),
                    DataCell(Text('Kulaklık')),
                    DataCell(Text('Apple Airpods')),
                    DataCell(Text('1250')),
                    DataCell(Text('5')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('345678912')),
                    DataCell(Text('Kulaklık')),
                    DataCell(Text('Apple Airpods')),
                    DataCell(Text('1250')),
                    DataCell(Text('5')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('345678912')),
                    DataCell(Text('Kulaklık')),
                    DataCell(Text('Apple Airpods')),
                    DataCell(Text('1250')),
                    DataCell(Text('5')),
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
