import 'package:algorithms_visualizer/providers/sort/sort_provider.dart';
import 'package:algorithms_visualizer/ux/widgets/sort/sort_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SortVisualizer<T extends SortProvider> extends StatelessWidget {
  const SortVisualizer({
    Key key,
    this.blockSize = 100,
  }) : super(key: key);

  final double blockSize;

  double _getHeight(Size size, int numOfWidgets) {
    final horizontalFit = size.width ~/ blockSize;
    final rows = (numOfWidgets / horizontalFit).ceil();
    return rows * blockSize;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<T>(
        builder: (_, provider, __) {
          return SizedBox(
            height: _getHeight(
              MediaQuery.of(context).size,
              provider.numbers.length,
            ),
            child: Stack(
              children: <Widget>[
                for (var i = 0; i < provider.numbers.length; i++)
                  SortWidget(
                    key: provider.numbers[i].key,
                    number: provider.numbers[i],
                    index: i,
                    widgetSize: blockSize,
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
