import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/theme_controller.dart';
import '/view/widget/my_app_bar.dart';
import '/model/enum/my_route.dart';
import 'category_controller.dart';
import 'constant.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});
  final _categoryController = Get.put(CategoryController());
  final _themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _categoryController,
      builder: (_) => buildScaffold(context),
      id: MyRoute.categoryScreen,
    );
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(appBarTitle),
      body: buildBody(context),
    );
  }

  Column buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: bodyColumnCrossAxisAlignment,
      children: [
        Expanded(
          child: buildDataTableRow(context),
        ),
        buildButtonRow(context),
      ],
    );
  }

  Padding buildDataTableRow(BuildContext context) {
    return Padding(
      padding: tableRowPadding,
      child: Row(
        crossAxisAlignment: tableRowCrossAxisAlignment,
        children: [
          buildDataTableContainer(context),
        ],
      ),
    );
  }

  Obx buildDataTableContainer(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: _themeController.containerColor.value,
          borderRadius: tableContainerBorderRadius,
        ),
        child: SingleChildScrollView(
          scrollDirection: tableScrollDirection,
          child: buildDataTable(context),
        ),
      ),
    );
  }

  DataTable buildDataTable(BuildContext context) {
    return DataTable(
      showCheckboxColumn: false,
      columns: const [
        DataColumn(label: Text(columnCodeText)),
        DataColumn(label: Text(columnNameText)),
        DataColumn(label: Text(columnProductCountText)),
        DataColumn(label: Text(columnEditText)),
        DataColumn(label: Text(columnDeleteText)),
      ],
      rows: const [],
    );
  }

  Row buildButtonRow(BuildContext context) {
    return Row(
      children: [
        buildAddButton(context),
      ],
    );
  }

  Padding buildAddButton(BuildContext context) {
    return Padding(
      padding: addButtonPadding,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: addButtonBorderRadius),
        ),
        child: const Text(addButtonText),
      ),
    );
  }
}
