import 'package:flutter/material.dart';
import 'package:flutter_folding_cell_demo/folding_cell_list.dart';
import 'package:flutter_folding_cell_demo/single_folding_cell.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Center(
              child: Text(
                'Folding Cell',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.looks_one,
              color: Colors.blue[900],
              size: 24,
            ),
            title: const Text('Single Folding Cell'),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, SingleFoldingCell.routeName);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.format_list_numbered,
              color: Colors.blue[900],
              size: 24,
            ),
            title: const Text('Folding Cell List'),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, FoldingCellList.routeName);
            },
          ),
        ],
      ),
    );
  }
}
