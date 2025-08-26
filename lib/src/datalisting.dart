
// ignore_for_file: deprecated_member_use_from_same_package

import 'package:datatablex/datatablex.dart';

import 'package:datatablex/src/shared/responsivex.dart';
import 'package:flutter/material.dart';

import 'form/itembody.dart';
import 'form/itemheader.dart';

///  [DataTableX] is the main entry to the usage of this plugin, it takes in [title],[heads] and [items] as a defaults startup
class DataTableX extends StatefulWidget {
  /// [title] is a String that serve as the identifier for the Datatable
  final String title;
  /// [onTap] it is used when someone taps on a row in the datatable
  final Function(Map)? onTap;
  final Function(List<Map>)? selecteditems;
  final List<TableHead> heads;
  final List items;
  final Map<String,dynamic>? lastRow;
  final Widget? titleWidget;
  final Widget? refreshButton;
  final TableOptions? tableOptions;
  final DataTableThemeX? dataTableThemex;
  final int maxRows;
  final EdgeInsets? margin;
  final bool hasSearchBar;
  final bool showNumbering;

   DataTableX(
      {super.key,
        this.onTap,
        required this.title,
        required this.heads,
        required this.items,
        this.titleWidget,
        this.margin,
        this.hasSearchBar =true,
        this.hastitleBar =true,
        this.selecteditems,
        this.tableOptions, this.refreshButton, DataTableThemeX? dataTableTheme, this.maxRows = 50,  this.lastRow, this.showNumbering =true}): dataTableThemex =  DataTableThemeX().merge(dataTableTheme);

  final bool hastitleBar ;

  @override
  State<DataTableX> createState() => _DataTableXState();
}

class _DataTableXState extends State<DataTableX> {
  TextEditingController search = TextEditingController();

  List filteredItems = [];
  List<Map> selectedItems = [];

  handleOnChange(String e) {
    setState(() {
      filteredItems = widget.items.where((element) {
        return widget.heads.any((action) {
          return element[action.id]
              .toString()
              .toLowerCase()
              .contains(e.toLowerCase());
        });
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
   return ResponsiveLayout(
      mobileWidget: Scaffold(

        appBar: AppBar(
//backgroundColor: widget.dataTableThemex?.headerDecoration?.color,
          automaticallyImplyLeading: false,
          leading: widget.refreshButton,
          title: Text(widget.title),
          actions: [widget.titleWidget ?? Container()],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              if(widget.hasSearchBar)SizedBox(
                height: 60,
                child: TextFormField(
                  controller: search,
                  onChanged: handleOnChange,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      hintText: 'Search',
                      // fillColor: Colors.white,
                      // filled: true,

                      hoverColor: Colors.transparent),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredItems.isEmpty
                      ? widget.items.length
                      : filteredItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    var item = filteredItems.isEmpty
                        ? widget.items[index]
                        : filteredItems[index];
                    var heads = widget.heads
                        .where((element) => element.isTitle)
                        .toList();
                    String title = heads.isEmpty
                        ? item[widget.heads[0].id].toString()
                        : item[heads[0].id].toString() ?? "";

                    var subtitlex = widget.heads
                        .where((element) => element.isSubtitle)
                        .toList();
                    String subtitle = subtitlex.isEmpty
                        ? item[widget.heads[1].id].toString()
                        : item[subtitlex[0].id].toString() ?? "";
                    return Card(
                      child: ExpansionTile(
                        //dense: true,
                        shape: RoundedRectangleBorder(),
                        /* leading: CircleAvatar(
                          child: Text((index + 1).toString()),
                        ),*/
                        leading: widget.selecteditems!=null?Checkbox(
                            value: selectedItems.contains(item),
                            onChanged: (e) {
                              if(widget.selecteditems==null) return;
                              setState(() {
                                if (selectedItems.contains(item)) {
                                  selectedItems.remove(item);
                                } else {
                                  selectedItems.add(item);
                                }
                                widget.selecteditems!(selectedItems);
                              });
                            }):Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(6)
                            ),
                            child: Text((index + 1).toString())),
                        title: Text(title),
                        subtitle: Text(subtitle),
                        trailing: widget.heads.any((e) => e.isbutton)
                            ? SizedBox(
                          child: widget.heads
                              .where((e) => e.isbutton)
                              .toList()[0]
                              .button!(item),
                        )
                            : null,
                        children: widget.heads.map((element) {
                          if (element.isbutton) {
                            return SizedBox();
                          }
                          return ListTile(
                            title: Text(item[element.id].toString() ),
                            subtitle: Text(element.title),
                          );
                        }).toList(),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      desktopWidget: Scaffold(
        body: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1400,
          ),
          child: Card(
            margin:widget.margin?? EdgeInsets.all(40).copyWith(top: 10),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(widget.hastitleBar)    SizedBox(
                    height: 45,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.title,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        widget.refreshButton??Container()
                      ],
                    ),
                  ),
                  if(widget.hasSearchBar)SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            width: 300,
                            child: TextFormField(
                              controller: search,
                              onChanged: handleOnChange,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(),
                                  hintText: 'Search',
                                  // fillColor: Colors.white,
                                  // filled: true,

                                  hoverColor: Colors.transparent),
                            ),
                          ),
                        ),
                        Spacer(),
                        widget.titleWidget ?? Container(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              ItemListHeader(
                                showNumbering: widget.showNumbering,
                                selecteditem: widget.selecteditems,
                                elements: widget.heads,
                                selectedItems: selectedItems,
                                onAccept: (number) {
                                  if (number.isEmpty) return;
                                  int value = int.tryParse(number) ?? 0;
                                  selectedItems.clear();
                                  for (int i = 1; i <= value && i<widget.items.length+1; i++) {
                                    setState(() {
                                      selectedItems.add(widget.items[i - 1]);
                                    });
                                  }
                                }, dataTableTheme: widget.dataTableThemex,
                              ),
                              ItemListBody(
                                showNumbering: widget.showNumbering,
                                lastRow: widget.lastRow,
                                maxRows: widget.maxRows,
                                dataTableTheme: widget.dataTableThemex,
                                selecteditem: widget.selecteditems,
                                head: widget.heads,
                                selectedItems: selectedItems,
                                items: filteredItems.isEmpty
                                    ? widget.items
                                    : filteredItems,
                                ontap: widget.onTap,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),

      ),);

  }
}











// String formatAccounting(double value,
//     {String currencySymbol = '\$', int decimalPlaces = 2}) {
//   // Round the value to the desired decimal places
//   double roundedValue = value.roundToDouble() +
//       double.parse((value % 1).toStringAsFixed(decimalPlaces).substring(1));
//
//   // Use the NumberFormat class to format the number with commas
//   var formatter = NumberFormat("#,##0.${'0' * decimalPlaces}", "en_US");
//
//   // Format the value and add the currency symbol
//   String formattedValue = formatter.format(roundedValue);
//
//   return "$currencySymbol$formattedValue";
// }
