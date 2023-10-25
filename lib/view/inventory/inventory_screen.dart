import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/model/enum/my_route.dart';
import '/view/constant/const_boolean.dart';
import '/view/constant/const_border.dart';
import '/view/constant/const_box_constraints.dart';
import '/view/constant/const_color.dart';
import '/view/constant/const_double.dart';
import '/view/constant/const_icon.dart';
import '/view/constant/const_padding.dart';
import '/view/constant/const_string.dart';
import '/view/constant/const_text_style.dart';
import '/view/inventory/inventory_controller.dart';
import '/view/theme/theme_controller.dart';
import '/view/widget/my_app_bar.dart';
import 'constant_string.dart';

class InventoryScreen extends StatelessWidget {
  InventoryScreen({super.key});

  final _themeController = Get.find<ThemeController>();
  final _inventoryController = Get.put(InventoryController());

  final Axis dataTableScrollDirection = Axis.vertical;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _inventoryController,
      builder: (_) => buildScaffold(context),
      id: MyRoute.inventoryScreen,
    );
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(inventoryScreenAppBarTitle),
      body: buildBody(context),
    );
  }

  Column buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDataTableRow(context),
        Row(
          children: [
            buildAddProductButton(),
            Padding(
              padding: addProductButtonPadding,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: borderRadius)),
                child: const Text(addCategoryButtonText),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Expanded buildDataTableRow(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: dataTablePadding,
            child: buildDataTableContainer(context),
          ),
        ],
      ),
    );
  }

  Obx buildDataTableContainer(BuildContext context) {
    return Obx(
      () => Container(
        width: MediaQuery.of(context).size.width * 0.75,
        decoration: BoxDecoration(
          color: _themeController.dataTableContainerColor.value,
          borderRadius: borderRadius,
        ),
        child: SingleChildScrollView(
          scrollDirection: dataTableScrollDirection,
          child: ClipRRect(
            borderRadius: borderRadius,
            child: buildDataTable(context),
          ),
        ),
      ),
    );
  }

  DataTable buildDataTable(BuildContext context) {
    return DataTable(
      showCheckboxColumn: showCheckboxColumn,
      columnSpacing: columnSpacing,
      border: tableBorder,
      columns: buildColumns(context),
      rows: [
        DataRow(
          cells: const [
            DataCell(Text('123456789')),
            DataCell(Text('Şarj Aleti')),
            DataCell(Text('Xiomi')),
            DataCell(Text('17Kb')),
            DataCell(Text('85')),
            DataCell(Text('45')),
            DataCell(SizedBox(
              width: 210,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.search, color: Colors.white),
                  Icon(Icons.edit, color: Colors.white),
                  Icon(Icons.delete, color: Colors.white),
                  Icon(Icons.delete, color: Colors.white),
                ],
              ),
            )),
          ],
          onSelectChanged: (selected) {},
        ),
      ],
    );
  }

  List<DataColumn> buildColumns(BuildContext context) {
    Stack searchBoxColumn = buildSearchBox(context);
    return [
      const DataColumn(label: Text(columnBarcode)),
      const DataColumn(label: Text(columnCategory)),
      const DataColumn(label: Text(columnBrand)),
      const DataColumn(label: Text(columnModel)),
      const DataColumn(label: Text(columnPrice), numeric: columnPriceNumeric),
      const DataColumn(
          label: Text(columnQuantity), numeric: columnQuantityNumeric),
      DataColumn(label: searchBoxColumn),
    ];
  }

  Stack buildSearchBox(BuildContext context) {
    return Stack(
      children: [
        buildTextFormField(context),
        buildSearchIcon(),
      ],
    );
  }

  Container buildTextFormField(BuildContext context) {
    return Container(
      color: searchBoxColor,
      child: TextFormField(
        focusNode: _inventoryController.searchFocusNode,
        controller: searchController,
        style: searchBoxTextStyle,
        decoration: const InputDecoration(
          contentPadding: searchBoxContentPadding,
          constraints: searchBoxConstraints,
        ),
        cursorColor: cursorColor,
        onChanged: null,
      ),
    );
  }

  Padding buildSearchIcon() {
    return Padding(
      padding: searchIconPadding,
      child: Obx(() =>
          Icon(searchIcon, color: _inventoryController.searchIconColor.value)),
    );
  }

  Padding buildAddProductButton() {
    return Padding(
      padding: addProductButtonPadding,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: borderRadius)),
        child: const Text(addProductButton),
      ),
    );
  }
}
