import 'package:algorithms_visualizer/models/sort_model.dart';
import 'package:flutter/material.dart';

class SortWidget extends StatelessWidget {
  const SortWidget({
    Key key,
    @required this.number,
    @required this.index,
    @required this.widgetSize,
  })  : assert(number != null && index != null && widgetSize != null),
        assert(index >= 0 && widgetSize > 30),
        super(key: key);

  final SortModel number;
  final int index;
  final double widgetSize;

  Offset _getPosition(Size size) {
    final horizontalFit = size.width ~/ widgetSize;
    final leftOver = size.width - (horizontalFit * widgetSize);
    print(leftOver);
    final verticalIndex = index ~/ horizontalFit;
    final horizontalIndex = index % horizontalFit;
    return Offset((widgetSize * horizontalIndex) + leftOver / 2,
        widgetSize * verticalIndex);
  }

  @override
  Widget build(BuildContext context) {
    final offset = _getPosition(MediaQuery.of(context).size);

    var _fontSize = 20.0;
    var _borderRadius = 5.0;
    var _borderWidth = 1.0;
    var _borderColor = Colors.black54;
    if (number.state == SortState.sort) {
      _fontSize = 32;
      _borderRadius = 40.0;
      _borderWidth = 2.0;
    } else if (number.state == SortState.sorted) {
      _fontSize = 20;
      _borderRadius = 5.0;
      _borderWidth = 1.0;
      _borderColor = Colors.green;
    }

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 1250),
      curve: Curves.elasticOut,
      left: offset.dx,
      top: offset.dy,
      child: SizedBox(
        width: widgetSize,
        height: widgetSize,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.ease,
            decoration: BoxDecoration(
              border: Border.all(
                color: _borderColor,
                width: _borderWidth,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(_borderRadius),
              ),
            ),
            child: Center(
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 400),
                curve: Curves.ease,
                style: TextStyle(
                  color: number.color,
                  fontSize: _fontSize,
                ),
                child: Text(
                  number.value.toString(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
