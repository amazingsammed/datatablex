import 'package:flutter/material.dart';

class DataTableThemeX {
  TextStyle headerTextStyle;
  TextStyle bodyTextStyle;
  BoxDecoration? headerDecoration;
  Decoration bodyDecoration;
  EdgeInsetsGeometry headerPadding;
  EdgeInsetsGeometry bodyPadding;

  DataTableThemeX({
    this.headerTextStyle = HeaderTextStyle,
    this.bodyTextStyle = BodyTextStyle,
    this.headerDecoration = HeaderDecoration,
    this.bodyDecoration = BodyDecoration,
    this.headerPadding = HeaderPadding,
    this.bodyPadding = BodyPadding,
  });
}

const TextStyle HeaderTextStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
const TextStyle BodyTextStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
const BoxDecoration HeaderDecoration = BoxDecoration(
    color: Colors.black54,
    // border: Border.all(color: Colors.black12),
    borderRadius: BorderRadius.only(
        topRight: Radius.circular(6), topLeft: Radius.circular(6)));
const EdgeInsets HeaderPadding =
    EdgeInsets.symmetric(horizontal: 20, vertical: 20);

const Decoration BodyDecoration = BoxDecoration();

const EdgeInsets BodyPadding =
    EdgeInsets.symmetric(horizontal: 20, vertical: 10);
