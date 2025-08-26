import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TableHead {
  final String title;
  final String id;
  final int size;
  @Deprecated(
    'Use widget instead. '
    'This is not required anymore',
  )
  final bool isbutton;
  final bool isTitle;
  final bool isSubtitle;
  final TableHeadType type;
  final double width;
  @Deprecated(
    'Use widget instead. '
    'This feature was deprecated',
  )
  final Widget? Function(Map<String, dynamic> data)? button;
  final Widget? Function(Map<String, dynamic> data)? widget;

  TableHead({
    required this.title,
    required this.id,
    this.size = 1,
    this.width = 200.0,
    @Deprecated(
      'Use widget instead. '
      'This is not required anymore',
    )
    this.isbutton = false,
    this.isTitle = false,
    this.isSubtitle = false,
    @Deprecated(
    'This is not required anymore',
    )
    this.type = TableHeadType.string,
    @Deprecated(
      'Use widget instead. '
      'This feature was deprecated',
    )
    this.button,
    this.widget,
  });
}

enum TableHeadType { string, int, double, bool, currency }
