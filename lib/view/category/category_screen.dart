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
      appBar: myAppBar('Kategoriler'),
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
      padding: dataTableRowPadding,
      child: Row(
        crossAxisAlignment: dataTableRowCrossAxisAlignment,
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
          color: _themeController.dataTableContainerColor.value,
          borderRadius: dataTableContainerBorderRadius,
        ),
        child: SingleChildScrollView(
          scrollDirection: dataTableScrollDirection,
          child: buildDataTable(context),
        ),
      ),
    );
  }

  DataTable buildDataTable(BuildContext context) {
    return DataTable(
      showCheckboxColumn: false,
      columns: const [
        DataColumn(label: Text(columnCategoryCodeText)),
        DataColumn(label: Text(columnCategoryNameText)),
        DataColumn(label: Text(columnProductCountText)),
        DataColumn(label: Text(columnEditText)),
        DataColumn(label: Text(columnDeleteText)),
      ],
      rows: [
        DataRow(
          onSelectChanged: (value) {},
          cells: [
            DataCell(Text('D123')),
            DataCell(Text('Kulaklık')),
            DataCell(Text('7')),
            DataCell(IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            )),
            DataCell(IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            )),
          ],
        ),
        DataRow(
          cells: [
            // Todo: Veri uzunluk sınırı getirilecek,
            DataCell(Text('D123')),
            DataCell(Text('Kulaklık')),
            DataCell(Text('7')),
            DataCell(IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            )),
            DataCell(IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            )),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('D123')),
            DataCell(Text('Kulaklık')),
            DataCell(Text('7')),
            DataCell(IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            )),
            DataCell(IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            )),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('D123')),
            DataCell(Text('Kulaklık')),
            DataCell(Text('7')),
            DataCell(IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            )),
            DataCell(IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            )),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('D123')),
            DataCell(Text('Kulaklık')),
            DataCell(Text('7')),
            DataCell(IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            )),
            DataCell(IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            )),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('D123')),
            DataCell(Text('Kulaklık')),
            DataCell(Text('7')),
            DataCell(IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            )),
            DataCell(IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            )),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('D123')),
            DataCell(Text('Kulaklık')),
            DataCell(Text('7')),
            DataCell(IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            )),
            DataCell(IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            )),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('D123')),
            DataCell(Text('Kulaklık')),
            DataCell(Text('7')),
            DataCell(IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            )),
            DataCell(IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            )),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('D123')),
            DataCell(Text('Kulaklık')),
            DataCell(Text('7')),
            DataCell(IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            )),
            DataCell(IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            )),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('D123')),
            DataCell(Text('Kulaklık')),
            DataCell(Text('7')),
            DataCell(IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            )),
            DataCell(IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            )),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('D123')),
            DataCell(Text('Kulaklık')),
            DataCell(Text('7')),
            DataCell(IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            )),
            DataCell(IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            )),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('D123')),
            DataCell(Text('Kulaklık')),
            DataCell(Text('7')),
            DataCell(IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            )),
            DataCell(IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            )),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('D123')),
            DataCell(Text('Kulaklık')),
            DataCell(Text('7')),
            DataCell(IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            )),
            DataCell(IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            )),
          ],
        ),
      ],
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
      padding: const EdgeInsets.only(left: 20, bottom: 20),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: const Text('Kategori Ekle'),
      ),
    );
  }
}
