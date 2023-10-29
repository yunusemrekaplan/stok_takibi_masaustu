import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stok_takibi_masaustu/view/category/category_screen.dart';

import '../theme/theme_controller.dart';
import '/view/widget/my_drawer.dart';
import '/view/widget/my_app_bar.dart';
import '/model/enum/my_route.dart';
import 'categories_controller.dart';
import 'constant.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  final _categoriesController = Get.put(CategoriesController());
  final _themeController = Get.find<ThemeController>();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _categoriesController,
      builder: (_) => buildScaffold(context),
      id: MyRoute.categoriesScreen,
    );
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(categoriesAppBarTitle),
      body: FutureBuilder(
        future: _categoriesController.getCategories(),
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
      rows: buildRows(),
    );
  }

  List<DataColumn> buildColumns(BuildContext context) {
    return [
      const DataColumn(label: Text(columnNameText)),
      const DataColumn(
        label: Text(columnProductCountText),
        numeric: columnProductCountNumeric,
      ),
      const DataColumn(label: Text(columnEditText)),
      const DataColumn(label: Text(columnDeleteText)),
      DataColumn(label: buildSearchBox(context)),
    ];
  }

  List<DataRow> buildRows() {
    return _categoriesController.categories!
        .map(
          (element) => DataRow(
            onSelectChanged: (value) => Get.to(
              () => CategoryScreen(
                category: element,
              ),
            ),
            cells: [
              DataCell(Text(element.name)),
              DataCell(Text(element.productCount.toString())),
              DataCell(IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              )),
              DataCell(IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete),
              )),
              const DataCell(Text('')),
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
        focusNode: _categoriesController.searchFocusNode,
        controller: searchController,
        style: searchBoxTextStyle,
        decoration: InputDecoration(
          contentPadding: searchBoxContentPadding,
          constraints: BoxConstraints(
            maxHeight: 35,
            minWidth: 210,
            maxWidth: MediaQuery.of(context).size.width * 0.2,
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
          color: _categoriesController.searchIconColor.value,
        ),
      ),
    );
  }

  Padding buildAddProductButton() {
    return Padding(
      padding: addCategoryButtonPadding,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: const Text(addButtonText),
      ),
    );
  }
}
