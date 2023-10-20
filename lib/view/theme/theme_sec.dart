import 'package:flutter/material.dart';
import 'package:stok_takibi_masaustu/view/constant/color.dart';
import 'package:stok_takibi_masaustu/view/constant/double.dart';
import 'package:stok_takibi_masaustu/view/constant/text_style.dart';

final themeSec = ThemeData(
  appBarTheme: appBarTheme(),
  elevatedButtonTheme: elevatedButtonThemeData(),
  inputDecorationTheme: inputDecorationTheme(),
  dataTableTheme: dataTableThemeData(),
  scrollbarTheme: scrollbarThemeData(),
  scaffoldBackgroundColor: secThemeScaffoldBackgroundColor,
);

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    backgroundColor: secThemeAppBarColor,
    titleTextStyle: appBarTitleTextStyle,
  );
}

ElevatedButtonThemeData elevatedButtonThemeData() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(secThemeButtonColor),
      textStyle: MaterialStateProperty.all<TextStyle>(buttonTextStyle),
    ),
  );
}

InputDecorationTheme inputDecorationTheme() {
  return const InputDecorationTheme(
    hintStyle: hintStyle,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: focusedColor,
        width: focusedWidth,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: errorColor,
        width: focusedWidth,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: defaultColor,
        width: defaultWidth,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: defaultColor,
        width: defaultWidth,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: errorColor,
        width: defaultWidth,
      ),
    ),
    constraints: BoxConstraints.tightFor(
      width: constraintWidth,
      height: constraintHeight,
    ),
  );
}

DataTableThemeData dataTableThemeData() {
  return DataTableThemeData(
    headingRowColor: MaterialStateProperty.all<Color>(secThemeDataTableHeadingRowColor),
    dataRowColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return secThemeScaffoldBackgroundColor;
        } else if (states.contains(MaterialState.pressed)) {
          return secThemeDataTableHeadingRowColor;
        }
        return null;
      },
    ),
    headingTextStyle: tableHeadingTextStyle,
    dataTextStyle: tableDataTextStyle,
  );
}

ScrollbarThemeData scrollbarThemeData() {
  return ScrollbarThemeData(
    thumbColor: MaterialStateProperty.all<Color>(scrollbarThumbColor),
  );
}
