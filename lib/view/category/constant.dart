import 'package:flutter/material.dart';

const CrossAxisAlignment bodyColumnCrossAxisAlignment =
    CrossAxisAlignment.start;
const CrossAxisAlignment tableRowCrossAxisAlignment = CrossAxisAlignment.start;

const EdgeInsets tableRowPadding = EdgeInsets.all(tableRowPaddingDouble);
const EdgeInsets addButtonPadding = EdgeInsets.only(
  left: addButtonLeftPaddingDouble,
  bottom: addButtonBottomPaddingDouble,
);

BorderRadius tableContainerBorderRadius = BorderRadius.circular(
  tableContainerBorderRadiusDouble,
);
BorderRadius addButtonBorderRadius = BorderRadius.circular(
  addButtonBorderRadiusDouble,
);

const Axis tableScrollDirection = Axis.vertical;

const String columnCodeText = 'Kategori Kodu';
const String columnNameText = 'Kategori Adı';
const String columnProductCountText = 'Ürün Sayısı';
const String columnEditText = 'Düzenle';
const String columnDeleteText = 'Sil';

const String appBarTitle = 'Kategoriler';
const String addButtonText = 'Kategori Ekle';

const double tableRowPaddingDouble = 20.0;
const double addButtonLeftPaddingDouble = 20.0;
const double addButtonBottomPaddingDouble = 20.0;
const double tableContainerBorderRadiusDouble = 25.0;
const double addButtonBorderRadiusDouble = 10.0;