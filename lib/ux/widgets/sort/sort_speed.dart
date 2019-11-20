import 'package:algorithms_visualizer/providers/sort/bubble_sort_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SortSpeed extends StatelessWidget {
  const SortSpeed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Selector<BubbleSortProvider, double>(
    //     selector: (_, bubble) => bubble.sortSpeed,
    //     builder: (_, value, child) {
    //       return Slider(
    //         value: value,
    //         onChanged: (val) {
    //           // value = val;
    //           Provider.of<BubbleSortProvider>(context, listen: false)
    //               .sortSpeed = val;
    //         },
    //       );
    //     });
    return Column(
      children: <Widget>[
        Consumer<BubbleSortProvider>(
          builder: (context, provider, child) {
            return Container(
              child: Slider(
                value: provider.sortSpeed,
                onChanged: (value) => provider.sortSpeed = value,
              ),
            );
          },
        ),
        Text('Sort Speed', style: Theme.of(context).textTheme.caption),
      ],
    );
  }
}
