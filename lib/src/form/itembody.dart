import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../datatablex.dart';

class ItemListBody extends StatefulWidget {
  final List<TableHead> head;
  final Function(Map)? ontap;
  final Function(List<Map>)? selecteditem;
  final List<Map> selectedItems;
  final DataTableThemeX? dataTableTheme;

  final List items;
  final int maxRows;

  const ItemListBody(
      {super.key,
      required this.head,
      required this.items,
      this.ontap,
      this.selecteditem,
      required this.selectedItems,
      this.dataTableTheme,
      required this.maxRows});

  @override
  State<ItemListBody> createState() => _ItemListBodyState();
}

class _ItemListBodyState extends State<ItemListBody> {
  int itemsperPag = 50;
  int _currentPage = 0;
  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: widget.items.isEmpty
            ? const Center(
                child: Text(
                'No Data Available',
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
            : Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                        controller: pageController,
                        onPageChanged: (page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        itemCount:
                            (widget.items.length / widget.maxRows).ceil(),
                        itemBuilder: (context, pageIndex) {
                          final start = pageIndex * widget.maxRows;
                          final end = start + widget.maxRows;
                          final items = widget.items.sublist(
                              start,
                              end > widget.items.length
                                  ? widget.items.length
                                  : end);

                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: items.length,
                            itemBuilder: (BuildContext context, int index) {
                              var item = items[index];
                              return InkWell(
                                onTap: () {
                                  if (widget.ontap == null) return;
                                  widget.ontap!(item);
                                },
                                child: Container(
                                  padding: widget.dataTableTheme?.bodyPadding ??
                                      bodyPadding,
                                  decoration: BoxDecoration(
                                    color: widget.selectedItems.contains(item)
                                        ? Colors.blue[100]
                                        : index%2!=0?Colors.grey.shade100:null,
                                    // color: controller.hoverColor.value,
                                    border: Border.all(color: Colors.black12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      widget.selecteditem != null
                                          ? SizedBox(
                                              width: 40,
                                              child: Checkbox(
                                                  value: widget.selectedItems
                                                      .contains(item),
                                                  onChanged: (e) {
                                                    if (widget.selecteditem ==
                                                        null) {
                                                      return;
                                                    }
                                                    setState(() {
                                                      if (widget.selectedItems
                                                          .contains(item)) {
                                                        widget.selectedItems
                                                            .remove(item);
                                                      } else {
                                                        widget.selectedItems
                                                            .add(item);
                                                      }
                                                      widget.selecteditem!(
                                                          widget.selectedItems);
                                                    });
                                                  }),
                                            )
                                          : SizedBox(),
                                      SizedBox(
                                        width: 40,
                                        child: Text(
                                            '${index + 1 + (_currentPage * widget.maxRows)}',style: TextStyle(fontWeight: FontWeight.bold),),
                                      ),
                                      ...widget.head.map((element) {
                                        var results = item[element.id];
                                        String data = "";
                                        if (element.type ==
                                            TableHeadType.string) {
                                          data = results ?? "";
                                        } else if (element.type ==
                                            TableHeadType.int) {
                                          data = "$results";
                                        } else if (element.type ==
                                            TableHeadType.double) {
                                          data = "$results";
                                        }
                                        if (element.isbutton) {
                                          return Expanded(
                                            flex: element.size *
                                                element.width.toInt(),
                                            child: Row(
                                              children: [
                                                element.button!(item) ??
                                                    Container()
                                              ],
                                            ),
                                          );
                                        }
                                        return Expanded(
                                          flex: element.size *
                                              element.width.toInt(),
                                          child: Text(data),
                                        );
                                      })
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Row(
                          children: List.generate(
                              (widget.items.length / widget.maxRows).ceil(),
                              (index) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      _currentPage = index;
                                      pageController.animateToPage(index,
                                          duration:
                                              Duration(microseconds: 200),
                                          curve: Curves.ease);
                                    });
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: _currentPage == index
                                              ? Colors.blue
                                              : null),
                                      child: Text(
                                        "${index + 1}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: _currentPage == index
                                                ? Colors.white
                                                : null),
                                      ))))),
                      Spacer(),
                     if(widget.selectedItems.isNotEmpty) Text(
                        "${widget.selectedItems.length} of ${widget.items.length} Row(s) Selected",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(onPressed: (){
                        String data = "";
                        for (var elementx in widget.head) {
                          data += "${elementx.title}\t";
                        }
                        data+="\n";
                        for (var element in widget.items) {
                          for (var elementx in widget.head) {
                            data += "${element[elementx.id]}\t";
                          }
                          data+="\n";                        }
Clipboard.setData(ClipboardData(text: data));

                      }, child: Text("Copy to Excel"))
                    ],
                  ),
                ],
              ));
  }
}
