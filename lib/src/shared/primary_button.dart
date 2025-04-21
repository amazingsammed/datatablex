import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicButton extends StatelessWidget {
  final Function()? onTap;
  final IconData? icon;
  final String? title;
  final double? height;
  final double? width;
  final Color? color;
  final bool hasIcon;
  final FocusNode? focusNode;

  const BasicButton(
      {Key? key,
      this.onTap,
      this.title,
      this.icon,
      this.height,
      this.width,
      this.hasIcon = true,
      this.color,
      this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var x = MediaQuery.of(context).size.width;
    if (MediaQuery.of(context).size.width < 600 ||
        MediaQuery.of(context).size.height < 300) return IconButton(onPressed: onTap, icon: Icon(icon??Icons.add),tooltip: title,);
    return ElevatedButton(
      focusNode: focusNode,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor:
            MaterialStateProperty.all<Color>(color ?? Colors.black38),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
      onPressed: onTap ??
          () {
            if (onTap == null) return;
          },
      child: SizedBox(
        height: 50,
        child: SizedBox(
          height: height,
          width: width,
          child: (x < 940 && hasIcon)
              ? Icon(
                  icon ?? Icons.add,
                  color: Colors.white,
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (hasIcon)
                      Icon(
                        icon ?? Icons.add,
                        color: Colors.white,
                      ),
                    if (hasIcon)
                      SizedBox(
                        width: 10,
                      ),
                    Text(
                      title ?? 'Add Product',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    if (hasIcon)
                      SizedBox(
                        width: 15,
                      )
                  ],
                ),
        ),
      ),
    );
  }
}
