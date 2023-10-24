import 'package:flutter/material.dart';

import 'constant_double.dart';

const bool dropdownIsExpanded = true;

const Color textColor = Colors.white;
const Color iconColor = Colors.white;
const Color underLineColor = Colors.white;
const Color dropdownColor = Colors.blueGrey;

const TextStyle textFormFieldTextStyle = TextStyle(
  color: textColor,
  fontSize: textFormFieldTextSize,
);
const TextStyle formTextStyle = TextStyle(color: textColor, fontSize: formTextSize);
const TextStyle dropdownHintTextStyle = TextStyle(
  color: textColor,
  fontSize: dropdownHintTextSize,
  height: dropdownHintTextHeight,
);
const TextStyle dropdownItemTextStyle = TextStyle(color: textColor, fontSize: dropdownValueTextSize);
const TextStyle dropdownButtonTextStyle = TextStyle(
  color: textColor,
  fontSize: dropdownValueTextSize,
  height: dropdownHintTextHeight,
);

BoxConstraints boxConstraints = const BoxConstraints(
  maxWidth: boxConstraintsMaxWidth,
  minHeight: boxConstraintsMinHeight,
  maxHeight: boxConstraintsMaxHeight,
);
BorderRadius borderRadius = BorderRadius.circular(borderRadiusDouble);
BorderSide borderSide = const BorderSide(color: Colors.white);
InputBorder textFormFieldBorder = UnderlineInputBorder(borderSide: borderSide);
InputBorder textFormFieldEnabledBorder = UnderlineInputBorder(borderSide: borderSide);

Icon dropDownIcon = const Icon(Icons.arrow_downward, color: iconColor);
