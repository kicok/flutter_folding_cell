# flutter_folding_cell_demo

- toggleFold() 를 통해서 Folding Cell을 열고 닫을수 있음

- toggleFold() 에 접근하는 방법

  1. GlobalKey 방식 : 생성될 FoldingCell 개수가 정해져있을 경우에 적합

     ```dart
     final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();
     ...
     body: Container(
         alignment: Alignment.topCenter,
         child: SimpleFoldingCell.create(
           key: _foldingCellKey,

     ...
     onPressed: () => _foldingCellKey.currentState?.toggleFold(),
     ```

  2. context.findAncestorStateOfType 방식 : FoldingCell가 GridView 로 보여질때 (갯수가 정해져 있지 않는 경우)

  - 반드시 아래와 같은 Builder.build 함수로 감싸 context가 전달되어야 한다.

    ```dart
    Builder(builder: (context) { //반드시 context가 전달되어야 한다.
      return Container(
        ....
        onPressed: () {
          final foldingCellState =
              context.findAncestorStateOfType<SimpleFoldingCellState>();
          foldingCellState?.toggleFold();
        },

    ```
