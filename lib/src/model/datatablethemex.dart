import 'package:flutter/material.dart';

class DataTableThemeX {
  TextStyle headerTextStyle;
  TextStyle bodyTextStyle;
  BoxDecoration? headerDecoration;
  Decoration bodyDecoration;
  EdgeInsetsGeometry headerPadding;
  EdgeInsetsGeometry bodyPadding;

  DataTableThemeX({
    this.headerTextStyle =  const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    this.bodyTextStyle = const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    this.headerDecoration =  const BoxDecoration(
        color: Colors.black54,
        // border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(6), topLeft: Radius.circular(6))),
    this.bodyDecoration = const  BoxDecoration(),
    this.headerPadding =  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    this.bodyPadding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  });

  DataTableThemeX merge (DataTableThemeX? others){
    if(others==null)return this;
    return copyWith(
      headerDecoration: headerDecoration?.copyWith(color: others.headerDecoration?.color)

    );
  }

  DataTableThemeX copyWith({
    TextStyle? headerTextStyle,
    TextStyle? bodyTextStyle,
    BoxDecoration? headerDecoration,
    Decoration? bodyDecoration,
    EdgeInsetsGeometry? headerPadding,
    EdgeInsetsGeometry? bodyPadding,
  }) {
    return DataTableThemeX(
      headerTextStyle: headerTextStyle ?? this.headerTextStyle,
      bodyTextStyle: bodyTextStyle ?? this.bodyTextStyle,
      headerDecoration: headerDecoration ?? this.headerDecoration,
      bodyDecoration: bodyDecoration ?? this.bodyDecoration,
      headerPadding: headerPadding ?? this.headerPadding,
      bodyPadding: bodyPadding ?? this.bodyPadding,
    );
  }
}

  final headerTextStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
const TextStyle bodyTextStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
const BoxDecoration headerDecoration = BoxDecoration(
    color: Colors.black54,
    // border: Border.all(color: Colors.black12),
    borderRadius: BorderRadius.only(
        topRight: Radius.circular(6), topLeft: Radius.circular(6)));
const EdgeInsets headerPadding =
    EdgeInsets.symmetric(horizontal: 20, vertical: 20);

const Decoration bodyDecoration = BoxDecoration();

const EdgeInsets bodyPadding =
    EdgeInsets.symmetric(horizontal: 20, vertical: 10);
