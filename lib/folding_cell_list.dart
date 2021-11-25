import 'package:flutter/material.dart';
import 'package:flutter_folding_cell_demo/main_drawer.dart';
import 'package:folding_cell/folding_cell/widget.dart';

class FoldingCellList extends StatelessWidget {
  const FoldingCellList({Key? key}) : super(key: key);

  static String routeName = '/folding-cell-list-route';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FoldingCellList'),
      ),
      body: Container(
        color: const Color(0xFF2e282a),
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return SimpleFoldingCell.create(
              frontWidget: buildFrontWidget(index),
              innerWidget: buildInnerWidget(index),
              cellSize: Size(MediaQuery.of(context).size.width, 125),
            );
          },
        ),
      ),
      drawer: const MainDrawer(),
    );
  }

  Widget buildFrontWidget(int index) {
    return Builder(builder: (context) {
      return Container(
        color: Colors.amber,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'CARD TITLE ${index + 1}',
                style: const TextStyle(
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
                onPressed: () {
                  final foldingCellState =
                      context.findAncestorStateOfType<SimpleFoldingCellState>();
                  foldingCellState?.toggleFold();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(80, 40),
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  Widget buildInnerWidget(int index) {
    return Builder(builder: (context) {
      return Container(
        color: const Color(0xFFecf2f9),
        padding: const EdgeInsets.only(top: 10),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'CARD TITLE ${index + 1}',
                style: const TextStyle(
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
                onPressed: () {
                  final foldingCellState =
                      context.findAncestorStateOfType<SimpleFoldingCellState>();
                  foldingCellState?.toggleFold();
                },
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
    });
  }
}
