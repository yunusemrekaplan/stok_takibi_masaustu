import 'package:flutter/material.dart';
import 'package:stok_takibi_masaustu/view/constant/color.dart';
import 'package:stok_takibi_masaustu/view/constant/double.dart';
import 'package:stok_takibi_masaustu/view/constant/text_style.dart';

final themeFirst = ThemeData(
  appBarTheme: appBarTheme(),
  elevatedButtonTheme: elevatedButtonThemeData(),
  inputDecorationTheme: inputDecorationTheme(),
  dataTableTheme: DataTableThemeData(
    headingRowColor: MaterialStateProperty.all<Color>(firstThemeDataTableHeadingRowColor),
    dataRowColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return firstThemeScaffoldBackgroundColor;
        } else if (states.contains(MaterialState.pressed)) {
          return firstThemeDataTableHeadingRowColor;
        }
        return null;
      },
    ),
    // headingTextStyle: MaterialStateProperty.all<TextStyle>(firstThemeDataTableHeadingTextStyle),
    // dataTextStyle: MaterialStateProperty.all<TextStyle>(firstThemeDataTableDataTextStyle),
    // dividerThickness: firstThemeDataTableDividerThickness,
  ),
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: MaterialStateProperty.all<Color>(scrollbarThumbColor),
  ),
  scaffoldBackgroundColor: firstThemeScaffoldBackgroundColor,
);

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    backgroundColor: firstThemeAppBarColor,
    titleTextStyle: appBarTitleTextStyle,
  );
}

ElevatedButtonThemeData elevatedButtonThemeData() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(firstThemeButtonColor),
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
