import 'package:flutter/material.dart';
import 'package:flutter_folding_cell_demo/folding_cell_list.dart';
import 'package:flutter_folding_cell_demo/single_folding_cell.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SingleFoldingCell(),
      routes: {
        FoldingCellList.routeName: (context) => const FoldingCellList(),
      },
    );
  }
}
