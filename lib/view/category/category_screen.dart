// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/data/category.dart';
import '../theme/theme_controller.dart';
import '../widget/my_app_bar.dart';
import 'category_controller.dart';
import 'constant.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key, required this.category});

  late Category category;
  late final _categoryController = Get.put(
    CategoryController(category: category),
  );
  final _themeController = Get.find<ThemeController>();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _categoryController,
      builder: (_) => buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(category.name),
      body: FutureBuilder(
        future: _categoryController.getProducts(),
        builder: builder,
      ),
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
      rows: buildRows(),
    );
  }

  List<DataColumn> buildColumns(BuildContext context) {
    return [
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

  List<DataRow> buildRows() {
    return _categoryController.products!
        .map(
          (element) => DataRow(
            cells: [
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
        focusNode: _categoryController.searchFocusNode,
        controller: searchController,
        style: searchBoxTextStyle,
        decoration: InputDecoration(
          contentPadding: searchBoxContentPadding,
          constraints: BoxConstraints(
            maxHeight: 35,
            minWidth: 210,
            maxWidth: MediaQuery.of(context).size.width * 0.174,
          ),
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
          color: _categoryController.searchIconColor.value,
        ),
      ),
    );
  }
}
