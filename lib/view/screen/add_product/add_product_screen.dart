import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stok_takibi_masaustu/model/enum/my_route.dart';
import 'package:stok_takibi_masaustu/view/constant/const_border.dart';
import 'package:stok_takibi_masaustu/view/get_controller/theme_controller.dart';
import 'package:stok_takibi_masaustu/view/screen/add_product/add_product_controller.dart';
import 'package:stok_takibi_masaustu/view/screen/add_product/constant.dart';
import 'package:stok_takibi_masaustu/view/widget/my_app_bar.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});

  final _addProductController = Get.put(AddProductController());
  final _themeController = Get.find<ThemeController>();
  final BorderRadius borderRadius = BorderRadius.circular(25);
  final headingRowColor = MaterialStateColor.resolveWith((states) => Colors.transparent);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _addProductController,
      builder: (_) => buildScaffold(context),
      id: MyRoute.addProductScreen,
    );
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(appBarTitle),
      body: buildBody(context),
    );
  }

  Center buildBody(BuildContext context) {
    return Center(
      child: Obx(
        () => Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            color: _themeController.dataTableContainerColor.value,
            borderRadius: borderRadius,
          ),
          child: Center(
            child: ClipRRect(
              borderRadius: borderRadius,
              child: buildDataTable(context),
            ),
          ),
        ),
      ),
    );
  }

  DataTable buildDataTable(BuildContext context) {
    return DataTable(
      border: tableBorder,
      headingRowColor: headingRowColor,
      columnSpacing: columnSpacing,
      horizontalMargin: horizontalMargin,
      headingRowHeight: headingRowHeight,
      dataRowMinHeight: MediaQuery.of(context).size.height * 0.08,
      dataRowMaxHeight: MediaQuery.of(context).size.height * 0.08,
      columns: buildColumns(),
      rows: buildRows(context),
    );
  }

  List<DataColumn> buildColumns() {
    return [
      DataColumn(
        label: Text(
          property,
          style: columnTextStyle,
        ),
        numeric: true,
      ),
      DataColumn(
        label: Text(
          registeredData,
          style: columnTextStyle,
        ),
      ),
      DataColumn(
        label: Text(
          newData,
          style: columnTextStyle,
        ),
      ),
    ];
  }

  List<DataRow> buildRows(BuildContext context) {
    return [
      DataRow(
        cells: [
          const DataCell(
            Text(
              barcodeDataCell,
              style: dataCellTextStyle,
            ),
          ),
          DataCell(
            buildDropdownButtonFormField(context),
          ),
          DataCell(
            TextFormField(
              decoration: InputDecoration(
                border: textFormFieldBorder,
                enabledBorder: textFormFieldEnabledBorder,
                hintText: 'Yeni Barkod',
                hintStyle: TextStyle(color: Colors.white),
                contentPadding: contentPadding,
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.18,
                  minWidth: MediaQuery.of(context).size.width * 0.18,
                ),
              ),
            ),
          ),
        ],
      ),
      const DataRow(
        cells: [
          DataCell(Text(
            'Ad',
            style: dataCellTextStyle,
          )),
          DataCell(Text('')),
          DataCell(Text('')),
        ],
      ),
      const DataRow(
        cells: [
          DataCell(Text(
            'Aded',
            style: dataCellTextStyle,
          )),
          DataCell(Text('')),
          DataCell(Text('')),
        ],
      ),
      const DataRow(
        cells: [
          DataCell(Text(
            'Marka',
            style: dataCellTextStyle,
          )),
          DataCell(Text('')),
          DataCell(Text('')),
        ],
      ),
      const DataRow(
        cells: [
          DataCell(Text(
            'Model',
            style: dataCellTextStyle,
          )),
          DataCell(Text('')),
          DataCell(Text('')),
        ],
      ),
      const DataRow(
        cells: [
          DataCell(Text(
            'Fiyat',
            style: dataCellTextStyle,
          )),
          DataCell(Text('')),
          DataCell(Text('')),
        ],
      ),
      const DataRow(
        cells: [
          DataCell(Text(
            'Para Birimi',
            style: dataCellTextStyle,
          )),
          DataCell(Text('')),
          DataCell(Text('')),
        ],
      ),
      DataRow(
        cells: [
          DataCell(
            ElevatedButton(onPressed: () {}, child: Text('Geri Dön')),
          ),
          DataCell(
            ElevatedButton(onPressed: () {}, child: Text('Geri Dön')),
          ),
          DataCell(
            ElevatedButton(onPressed: () {}, child: Text('Geri Dön')),
          ),
        ],
      ),
    ];
  }

  DropdownButtonFormField<int> buildDropdownButtonFormField(BuildContext context) {
    return DropdownButtonFormField(
      dropdownColor: dropdownColor,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.18,
          minWidth: MediaQuery.of(context).size.width * 0.18,
        ),
      ),
      items: const [
        DropdownMenuItem(
          value: 1,
          child: Text('Test1', style: TextStyle(color: Colors.white)),
        ),
        DropdownMenuItem(
          value: 2,
          child: Text('Test2', style: TextStyle(color: Colors.white)),
        ),
        DropdownMenuItem(
          value: 3,
          child: Text('Test3', style: TextStyle(color: Colors.white)),
        ),
      ],
      icon: dropdownIcon,
      onChanged: (value) {},
    );
  }
}
