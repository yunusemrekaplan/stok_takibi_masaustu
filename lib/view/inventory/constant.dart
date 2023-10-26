import 'package:flutter/material.dart';

const Axis tableScrollDirection = Axis.vertical;

const String loginScreenAppBarTitle = 'Login Screen';
const String emailHintText = 'E-mail';
const String passwordHintText = 'Password';
const String loginButtonText = 'Login';
const String loginFailedMessage = 'Login failed';
const String columnBarcode = 'Barkod';
const String columnCategory = 'Kategori';
const String columnBrand = 'Marka';
const String columnModel = 'Model';
const String columnPrice = 'Fiyat';
const String columnCurrency = 'Para Birimi';
const String columnQuantity = 'Adet';
const String addCategoryButtonText = 'Kategori Ekle';
const String inventoryScreenAppBarTitle = 'Envanter';
const String addProductScreenAppBarTitle = 'Ürün Ekle';
const String addProductButton = 'Ürün Ekle';

const EdgeInsets dataTablePadding = EdgeInsets.all(dataTableAllPadding);
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
const EdgeInsets addProductButtonPadding = EdgeInsets.only(
  left: addProductButtonLeftPadding,
  bottom: addProductButtonBottomPadding,
);

const double dataTableAllPadding = 20.0;
const double columnSpacing = 25.0;
const double searchBoxFontSize = 16.0;
const double searchBoxContentLeftPadding = 5.0;
const double searchBoxContentRightPadding = 5.0;
const double searchBoxContentTopPadding = 0.0;
const double searchBoxContentBottomPadding = 10.0;
const double addProductButtonLeftPadding = 20.0;
const double addProductButtonBottomPadding = 10.0;
const double searchIconLeftPadding = 180.0;
const double searchIconTopPadding = 6.0;
const double borderSideWith = 0.7;
const double borderRadiusCircular = 25.0;
const double iconCellBoxSize = 210.0;

const TextStyle searchBoxTextStyle =
    TextStyle(color: textColor, fontSize: searchBoxFontSize);

const Color textColor = Colors.white;
const Color defaultColor = Colors.white;
const Color focusedColor = Colors.green;
const Color errorColor = Colors.red;
const Color iconColor = Colors.white;
const Color transparent = Colors.transparent;
const Color cursorColor = Colors.white;
const Color searchBoxColor = Colors.white30;
const Color borderSideColor = Colors.white;

BorderRadius borderRadius = BorderRadius.circular(borderRadiusCircular);

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
const bool columnPriceNumeric = true;
const bool columnQuantityNumeric = true;
const bool showCheckboxColumn = false;
const IconData searchIcon = Icons.search;

const searchBoxConstraints = BoxConstraints(maxHeight: 35, maxWidth: 210);
