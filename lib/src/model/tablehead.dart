import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TableHead {
  final String title;
  final String id;
  final int size;
  final bool isbutton;
  final bool isTitle;
  final bool isSubtitle;
  final TableHeadType type;
  final double width;
  final Widget? Function(Map<String, dynamic> data)? button;

  TableHead({
    required this.title,
    required this.id,
    this.size = 1,
    this.width = 200.0,
    this.isbutton = false,
    this.isTitle = false,
    this.isSubtitle = false,
    this.type = TableHeadType.string,
    this.button,
  });
}

enum TableHeadType { string, int, double, bool, currency }