import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileWidget;
  final Widget? tabletWidget;
  final Widget desktopWidget;

  const ResponsiveLayout({
    super.key,
    required this.mobileWidget,
     this.tabletWidget,
    required this.desktopWidget,
  });

  @override
  Widget build(BuildContext context) {
    return getResponsiveWidget(context);
  }

  Widget getResponsiveWidget(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.width;

    if (screenWidth >= 600 || screenHeight<=300) {
      return desktopWidget;
    } else if (tabletWidget!=null) {
      return tabletWidget??mobileWidget;
    } else {
      return mobileWidget;
    }
  }
}
