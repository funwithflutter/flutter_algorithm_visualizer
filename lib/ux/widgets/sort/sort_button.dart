import 'package:algorithms_visualizer/providers/sort/bubble_sort_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SortButton extends StatelessWidget {
  const SortButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Selector<BubbleSortProvider, bool>(
        // selector: (_, bubble) => bubble.isSorting,
        // builder: (_, data, child) {
        //   return RaisedButton(
        //       onPressed: data
        //           ? null
        //           : () {
        //               Provider.of<BubbleSortProvider>(context, listen: false)
        //                   .sort();
        //             },
        //       child: child);
        // },
        // child: const Text('Sort'));
    return Consumer<BubbleSortProvider>(
      builder: (_, sortProvider, child) {
        return RaisedButton(
          child: child,
          onPressed: sortProvider.isSorting
              ? null
              : () {
                  sortProvider.sort();
                },
        );
      },
      child: const Text('Sort'),
    );
  }
}