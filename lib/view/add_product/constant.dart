import 'package:flutter/material.dart';

const String barcodeText = 'Barkod:';
const String brandText = 'Marka:';
const String modelText = 'Model:';
const String priceText = 'Fiyat:';
const String addCategoryAppBarTitle = 'Kategori Ekle';
const String barcodeHintText = 'Barkod Giriniz';
const String brandHintText = 'Marka Giriniz';
const String modelHintText = 'Model Giriniz';
const String priceHintText = 'Fiyat Giriniz';
const String addProductButtonText = 'Ürün Ekle';
const String validatorMessage = 'Lütfen bir değer giriniz.';

const double paddingBoxHeight = 20.0;
const double textBoxWidth = 100.0;
const double textBoxHeight = 60.0;
const double addProductButtonRowWidth = 430.0;
const double addProductButtonTextSize = 24.0;

const MainAxisAlignment formRowMainAxisAlignment = MainAxisAlignment.center;
const MainAxisAlignment formMainAxisAlignment = MainAxisAlignment.center;
const AutovalidateMode always = AutovalidateMode.always;
const AutovalidateMode disabled = AutovalidateMode.disabled;

const EdgeInsets addProductButtonPadding = EdgeInsets.only(
  left: addProductButtonPaddingLeft,
  right: addProductButtonPaddingRight,
);
const addProductButtonPaddingLeft = 110.0;
const addProductButtonPaddingRight = 180.0;

const EdgeInsets contentPadding = EdgeInsets.only(
  left: contentPaddingLeft,
  right: contentPaddingRight,
);
const double contentPaddingLeft = 10.0;
const double contentPaddingRight = 10.0;

const EdgeInsets textFormFieldPadding = EdgeInsets.only(
  left: textFormFieldPaddingLeft,
  right: textFormFieldPaddingRight,
  bottom: textFormFieldPaddingBottom,
);
const double textFormFieldPaddingLeft = 10.0;
const double textFormFieldPaddingRight = 20.0;
const double textFormFieldPaddingBottom = 0.0;

const TextStyle textFormFieldTextStyle = TextStyle(
  color: textColor,
  fontSize: textFormFieldTextSize,
);
const TextStyle formTextStyle = TextStyle(color: textColor, fontSize: formTextSize);
const Color textColor = Colors.white;
const double textFormFieldTextSize = 24;
const double formTextSize = 30;

const BoxConstraints boxConstraints = BoxConstraints(
  maxWidth: boxConstraintsMaxWidth,
  minHeight: boxConstraintsMinHeight,
  maxHeight: boxConstraintsMaxHeight,
);
const double boxConstraintsMaxWidth = 300;
const double boxConstraintsMinHeight = 70;
const double boxConstraintsMaxHeight = 70;

BorderRadius borderRadius = BorderRadius.circular(borderRadiusDouble);
const double borderRadiusDouble = 25.0;

InputBorder textFormFieldBorder = UnderlineInputBorder(borderSide: borderSide);
InputBorder textFormFieldEnabledBorder = UnderlineInputBorder(borderSide: borderSide);
BorderSide borderSide = const BorderSide(color: Colors.white);
