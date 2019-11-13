import 'package:algorithms_visualizer/models/sort_model.dart';
import 'package:flutter/material.dart';

class SortWidget extends StatelessWidget {
  const SortWidget({
    Key key,
    @required this.number,
    @required this.positionIndex,
    this.widgetSize = 100.0,
  }) : super(key: key);

  final SortModel number;
  final int positionIndex;
  final double widgetSize;

  Offset _getPosition(Size size) {
    final horizontalFit = size.width ~/ widgetSize;
    print('size width: ${size.width} and fit: $horizontalFit');
    final verticalIndex = positionIndex ~/ horizontalFit;
    print('index: $positionIndex; verticalIndex: $verticalIndex');
    final horizontalIndex = positionIndex % horizontalFit;
    print('modulus: ${positionIndex % horizontalFit}');
    return Offset(widgetSize * horizontalIndex, widgetSize * verticalIndex);
  }

  @override
  Widget build(BuildContext context) {
    // return Positioned(left: 0, top: 0, child: Text('hi'));
    // return Text('hi');
    final offset = _getPosition(MediaQuery.of(context).size);

    return AnimatedPositioned(
      duration: Duration(milliseconds: 600),
      left: offset.dx,
      top: offset.dy,
      child: Container(
        width: widgetSize,
        height: widgetSize,
        child: Center(
          child: Text(
            number.value.toString(),
          ),
        ),
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Text(number.value.toString()),
    // );
  }
}
