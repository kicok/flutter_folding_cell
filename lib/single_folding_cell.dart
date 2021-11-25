import 'package:flutter/material.dart';
import 'package:flutter_folding_cell_demo/main_drawer.dart';
import 'package:folding_cell/folding_cell.dart';

class SingleFoldingCell extends StatefulWidget {
  const SingleFoldingCell({Key? key}) : super(key: key);

  static String routeName = '/';

  @override
  State<SingleFoldingCell> createState() => _SingleFoldingCellState();
}

class _SingleFoldingCellState extends State<SingleFoldingCell> {
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Single Folding Cell'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: SimpleFoldingCell.create(
          key: _foldingCellKey,
          frontWidget: buildFrontWidget(),
          innerWidget: buildInnerWidget(),
          cellSize: Size(MediaQuery.of(context).size.width, 140),
          padding: const EdgeInsets.all(15),
          // unfoldCell: true,
          borderRadius: 10,
          onOpen: () => print('Open'),
          onClose: () => print('Close'),
        ),
      ),
      drawer: const MainDrawer(),
    );
  }

  Widget buildFrontWidget() {
    return Container(
      color: Colors.amber,
      alignment: Alignment.center,
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              'CARD TITLE',
              style: TextStyle(
                fontFamily: 'LeckerliOne',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width / 2 - 60,
            width: 60,
            height: 30,
            bottom: 10,
            child: TextButton(
              child: const Text('OPEN'),
              onPressed: () => _foldingCellKey.currentState?.toggleFold(),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: const Size(80, 40),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildInnerWidget() {
    return Container(
      color: const Color(0xFFecf2f9),
      padding: const EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Text(
              'CARD TITLE',
              style: TextStyle(
                fontFamily: 'LeckerliOne',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              "CARD DETAIL",
              style: TextStyle(
                color: Color(0xFF2e282a),
                fontSize: 22.0,
              ),
            ),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width / 2 - 60,
            width: 60,
            bottom: 10,
            child: TextButton(
              onPressed: () => _foldingCellKey.currentState?.toggleFold(),
              child: const Text(
                "Close",
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: const Size(80, 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
