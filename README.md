# DataTableX

A custom flutter datatable

## Getting Started

Basic way to use, Now documenting it

```Dart

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
          heads: [
            TableHead(title: 'Name', id: 'name'),
            TableHead(title: 'Gender', id: 'gender'),
            TableHead(title: 'Dob', id: 'dob'),
            TableHead(title: 'Guardian', id: 'gr'),
            TableHead(title: 'Contact', id: 'grc'),
            TableHead(title: 'Action', id: 'button'),
          ],
          items: List.generate(100, (generator){
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


```

# other helpful widget included

- PrimaryButton
- TableButton

