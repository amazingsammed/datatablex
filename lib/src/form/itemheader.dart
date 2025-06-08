import 'package:flutter/material.dart';

import '../../datatablex.dart';

class ItemListHeader extends StatelessWidget {
  final List<TableHead> elements;
  final List<Map> selectedItems;
  final Function(String) onAccept;
  final Function(List<Map> p1)? selecteditem;
  final DataTableThemeX? dataTableTheme;


  const ItemListHeader(
      {super.key,
        required this.elements,
        required this.selectedItems,
        required this.onAccept,  this.selecteditem,  this.dataTableTheme});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: dataTableTheme?.headerPadding?? HeaderPadding,
      decoration: dataTableTheme?.headerDecoration??HeaderDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(selecteditem!=null)SizedBox(
              width: 45,
              child: IconButton(
                onPressed: () {
                  // Get.dialog(AlertDialog(
                  //   title: Text("Rows to be selected"),
                  //   content: Column(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       TextField(
                  //         controller: number,
                  //         keyboardType: TextInputType.number,
                  //         decoration: InputDecoration(
                  //             border: OutlineInputBorder(),
                  //             label: Text("Enter number here"),
                  //             hintText: '50'),
                  //       ),
                  //     ],
                  //   ),
                  //   actions: [
                  //     ElevatedButton(
                  //         onPressed: ()=>onAccept(number.text),
                  //         child: Text("Accept"))
                  //   ],
                  // ));
                },
                icon: Icon(Icons.menu_open),
              )),
          SizedBox(width: 40,child: Text('No',style: dataTableTheme?.headerTextStyle??HeaderTextStyle,),),SizedBox(),
          ...elements.map((item) {
            return Expanded(
              flex: item.size * item.width.toInt(),

              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      item.title,overflow: TextOverflow.ellipsis,
                      style: dataTableTheme?.headerTextStyle??HeaderTextStyle,
                    ),
                  ),
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}