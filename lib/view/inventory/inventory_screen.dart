import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/model/enum/my_route.dart';
import '/view/inventory/inventory_controller.dart';
import '/view/theme/theme_controller.dart';
import '/view/widget/my_app_bar.dart';
import '/view/widget/my_drawer.dart';
import 'constant.dart';

class InventoryScreen extends StatelessWidget {
  InventoryScreen({super.key});

  final _themeController = Get.find<ThemeController>();
  final _inventoryController = Get.put(InventoryController());
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
      body: FutureBuilder(
        future: _inventoryController.getProducts(),
        builder: builder,
      ),
      drawer: const MyDrawer(),
    );
  }

  Widget builder(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
      return buildBody(context);
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  Column buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() => buildDataTableRow(context)),
        Row(
          children: [
            buildAddProductButton(),
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
          Expanded(
            child: Padding(
              padding: dataTablePadding,
              child: buildDataTableContainer(context),
            ),
          ),
        ],
      ),
    );
  }

  Container buildDataTableContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _themeController.containerColor.value,
        borderRadius: borderRadius,
      ),
      child: SingleChildScrollView(
        scrollDirection: tableScrollDirection,
        child: ClipRRect(
          borderRadius: borderRadius,
          child: buildDataTable(context),
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
      rows: buildRows(context),
    );
  }

  List<DataColumn> buildColumns(BuildContext context) {
    return [
      const DataColumn(label: Text(columnBarcode)),
      const DataColumn(label: Text(columnCategory)),
      const DataColumn(label: Text(columnBrand)),
      const DataColumn(label: Text(columnModel)),
      const DataColumn(
        label: Text(columnPrice),
        numeric: columnPriceNumeric,
      ),
      const DataColumn(label: Text(columnCurrency)),
      const DataColumn(
        label: Text(columnQuantity),
        numeric: columnQuantityNumeric,
      ),
      DataColumn(label: buildSearchBox(context)),
    ];
  }

  List<DataRow> buildRows(BuildContext context) {
    return _inventoryController.products!
        .map(
          (element) => DataRow(
            cells: [
              DataCell(Text(element.barcode!)),
              DataCell(Text(element.category)),
              DataCell(Text(element.brand)),
              DataCell(Text(element.model)),
              DataCell(Text(element.price.toString())),
              DataCell(Text(element.currency)),
              DataCell(Text(element.quantity.toString())),
              const DataCell(
                SizedBox(
                  width: iconCellBoxSize,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.edit, color: iconColor),
                      Icon(Icons.delete, color: iconColor),
                      Icon(Icons.add, color: iconColor),
                      Icon(Icons.remove, color: iconColor),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
        .toList();
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
      child: Obx(
        () => Icon(
          searchIcon,
          color: _inventoryController.searchIconColor.value,
        ),
      ),
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
