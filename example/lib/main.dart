import 'package:flutter/material.dart';
import 'package:datatablex/datatablex.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DataTableX Example'),
        ),
        body: DataTableX(
          refreshButton: Container(),
          title: 'Student Management',
          maxRows: 100,
          heads: [
            TableHead(title: 'Name', id: 'name'),
            TableHead(title: 'Gender', id: 'gender'),
            TableHead(title: 'Dob', id: 'dob'),
            TableHead(title: 'Guardian', id: 'gr'),
            TableHead(title: 'Action', id: 'button', widget: (item) {
              return Icon(Icons.more_vert);
                }),
            TableHead(
                title: 'Contact',
                id: 'grc',
                widget: (item) {
                  
                  return Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.red),
                    child: Text(item['grc']),
                  );
                }),

          ],
          titleWidget: Row(
            children: [BasicButton(title: "Add Button")],
          ),
         // selecteditems: (a){},
          items: List.generate(20, (i) {
            return {
              'name': "Sammed_$i",
              'gender': "Male",
              'dob': "2013",
              'gr': "Mr.James",
              'grc': "+233 34567890",
            };
          }),
          lastRow: {
            'name': "Total",

            'gr': "400",
          },
        ),
      ),
    );
  }
}

// items: List.generate(600, (generator){
// return  {
// 'name': "Sammed",
// 'gender': "Male",
// 'dob': "${generator}-01-2023",
// 'gr': "Mr.Samuel",
// 'grc': "+233 34567890",
// 'button': "Sammed",
// };
// }),
