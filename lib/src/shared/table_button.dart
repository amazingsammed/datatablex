
import 'package:datatablex/src/shared/responsivex.dart';
import 'package:flutter/material.dart';

enum Variant { solid, outline }
class TableButton extends StatelessWidget {
  final IconData icon;
  final Color bgColor;
  final Function()? ontap;
  final Function()? onLongPress;
  final Function()? onDoubleTap;
  final Variant variant;

  const TableButton(
      {super.key,
        required this.icon,
        required this.bgColor,
        this.ontap,
        this.onLongPress,
        this.onDoubleTap,
        this.variant = Variant.solid});

  @override
  Widget build(BuildContext context) {
   return ResponsiveLayout(mobileWidget: InkWell(
      onTap: ontap,
      onLongPress: onLongPress,
      onDoubleTap: onDoubleTap,
      child: Container(
        alignment: Alignment.center,
        child: Icon(
          icon,
          color:bgColor,
        ),
      ),
    ),
      desktopWidget: InkWell(
        onTap: ontap,
        onLongPress: onLongPress,
        onDoubleTap: onDoubleTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          alignment: Alignment.center,

          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: variant==Variant.solid?bgColor:Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: variant==Variant.outline?Border.all(color:
              bgColor):null
          ),
          child: Icon(
            icon,
            color:variant==Variant.outline?bgColor: Colors.white60,

            size: 20,
          ),
        ),
      ),);
  }
}