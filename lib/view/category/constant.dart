import 'package:flutter/material.dart';

const TextStyle searchBoxTextStyle =
    TextStyle(color: textColor, fontSize: searchBoxFontSize);

const CrossAxisAlignment bodyColumnCrossAxisAlignment =
    CrossAxisAlignment.start;
const CrossAxisAlignment tableRowCrossAxisAlignment = CrossAxisAlignment.start;

const EdgeInsets tableRowPadding = EdgeInsets.all(tableRowPaddingDouble);
const EdgeInsets addButtonPadding = EdgeInsets.only(
  left: addButtonLeftPaddingDouble,
  bottom: addButtonBottomPaddingDouble,
);
const EdgeInsets dataTablePadding = EdgeInsets.all(dataTableAllPadding);

BorderRadius tableContainerBorderRadius = BorderRadius.circular(
  tableContainerBorderRadiusDouble,
);
BorderRadius addButtonBorderRadius = BorderRadius.circular(
  addButtonBorderRadiusDouble,
);
BorderRadius borderRadius = BorderRadius.circular(borderRadiusCircular);

const Axis tableScrollDirection = Axis.vertical;

const String columnNameText = 'Kategori Adı';
const String columnProductCountText = 'Ürün Sayısı';
const String columnEditText = 'Düzenle';
const String columnDeleteText = 'Sil';
const String columnCategory = 'Kategori';
const String columnBrand = 'Marka';
const String columnModel = 'Model';
const String columnPrice = 'Fiyat';
const String columnCurrency = 'Para Birimi';
const String columnQuantity = 'Adet';

const String categoriesAppBarTitle = 'Kategoriler';
const String addButtonText = 'Kategori Ekle';

const double dataTableAllPadding = 20.0;
const double tableRowPaddingDouble = 20.0;
const double addButtonLeftPaddingDouble = 20.0;
const double addButtonBottomPaddingDouble = 20.0;
const double tableContainerBorderRadiusDouble = 25.0;
const double addButtonBorderRadiusDouble = 10.0;
const double borderRadiusCircular = 25.0;
const double columnSpacing = 25.0;
const double borderSideWith = 0.7;
const double searchBoxFontSize = 16.0;
const double searchBoxContentLeftPadding = 5.0;
const double searchBoxContentRightPadding = 5.0;
const double searchBoxContentTopPadding = 0.0;
const double searchBoxContentBottomPadding = 10.0;
const double searchIconLeftPadding = 5.0;
const double searchIconTopPadding = 6.0;
const double addCategoryButtonLeftPadding = 20.0;
const double addCategoryButtonBottomPadding = 10.0;
const double iconCellBoxSize = 210.0;

const bool columnProductCountNumeric = true;
const bool showCheckboxColumn = false;
const bool columnPriceNumeric = true;
const bool columnQuantityNumeric = true;

const Color borderSideColor = Colors.white;
const Color searchBoxColor = Colors.white30;
const Color textColor = Colors.white;
const Color cursorColor = Colors.white;
const Color iconColor = Colors.white;

TableBorder tableBorder = TableBorder(
  horizontalInside: const BorderSide(
    width: borderSideWith,
    color: borderSideColor,
  ),
  verticalInside: const BorderSide(
    width: borderSideWith,
    color: borderSideColor,
  ),
  borderRadius: borderRadius,
);

const EdgeInsets searchBoxContentPadding = EdgeInsets.fromLTRB(
  searchBoxContentLeftPadding,
  searchBoxContentTopPadding,
  searchBoxContentRightPadding,
  searchBoxContentBottomPadding,
);
const EdgeInsets searchIconPadding = EdgeInsets.only(
  left: searchIconLeftPadding,
  top: searchIconTopPadding,
);
const EdgeInsets addCategoryButtonPadding = EdgeInsets.only(
  left: addCategoryButtonLeftPadding,
  bottom: addCategoryButtonBottomPadding,
);

const searchBoxConstraints = BoxConstraints(maxHeight: 35, maxWidth: 210);

const IconData searchIcon = Icons.search;
