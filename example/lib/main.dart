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
          title: 'Student Management',
          maxRows: 100,
          heads: [
            TableHead(title: 'Name', id: 'name'),
            TableHead(title: 'Gender', id: 'gender'),
            TableHead(title: 'Dob', id: 'dob'),
            TableHead(title: 'Guardian', id: 'gr'),
            TableHead(title: 'Contact', id: 'grc'),
            TableHead(title: 'Action', id: 'button',isbutton: true,button: (item){
              return Icon(Icons.more_vert);
            }),
          ],
          titleWidget: Row(
            children: [
              BasicButton(title: "Add")
            ],
          ),
          selecteditems: (a){},
          items: List.generate(600, (generator){
            return  {
              'name': "Sammed",
              'gender': "Male",
              'dob': "${generator}-01-2023",
              'gr': "Mr.Samuel",
              'grc': "+233 34567890",
              'button': "Sammed",
            };
          }),
        ),
      ),
    );
  }
}
