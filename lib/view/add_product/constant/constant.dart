import 'package:flutter/material.dart';

import 'constant_color.dart';
import 'constant_double.dart';

const bool dropdownIsExpanded = true;

BoxConstraints boxConstraints = const BoxConstraints(
  maxWidth: boxConstraintsMaxWidth,
  minHeight: boxConstraintsMinHeight,
  maxHeight: boxConstraintsMaxHeight,
);
BorderRadius borderRadius = BorderRadius.circular(borderRadiusDouble);
BorderSide borderSide = const BorderSide(color: borderSideColor);
InputBorder textFormFieldBorder = UnderlineInputBorder(borderSide: borderSide);
InputBorder textFormFieldEnabledBorder =
    UnderlineInputBorder(borderSide: borderSide);

Icon dropDownIcon = const Icon(Icons.arrow_downward, color: iconColor);
