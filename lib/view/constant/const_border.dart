import 'package:flutter/material.dart';
import 'package:stok_takibi_masaustu/view/constant/const_color.dart';
import 'const_double.dart';

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
