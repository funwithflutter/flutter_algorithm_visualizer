import 'package:algorithms_visualizer/providers/sort/bubble_sort_provider.dart';
import 'package:algorithms_visualizer/ux/widgets/sort/sort_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SortVisualizer extends StatelessWidget {
  const SortVisualizer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleSortProvider>(
      builder: (_, provider, __) {
        // return Wrap(
        //   alignment: WrapAlignment.center,
        //   crossAxisAlignment: WrapCrossAlignment.center,
        //   children: <Widget>[
        //     for (var number in provider.numbers)
        //       SortWidget(
        //         number: number,
        //       ),
        //   ],
        // );
        return Stack(
          children: <Widget>[
            for (var i = 0; i < provider.numbers.length; i++)
              SortWidget(
                number: provider.numbers[i],
                positionIndex: i,
              )
          ],
        );
      },
    );
    // return PositionedTransition
  }
}
