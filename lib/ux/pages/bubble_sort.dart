import 'package:algorithms_visualizer/ux/widgets/sort/sort_speed.dart';
import 'package:algorithms_visualizer/ux/widgets/sort/sort_visualizer.dart';
import 'package:algorithms_visualizer/ux/widgets/sort/sort_button.dart';
import 'package:flutter/material.dart';

class BubbleSortPage extends StatefulWidget {
  const BubbleSortPage({Key key}) : super(key: key);

  @override
  _BubbleSortPageState createState() => _BubbleSortPageState();
}

class _BubbleSortPageState extends State<BubbleSortPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const SizedBox(
            height: 64,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Text('Bubble Sort',
                style: Theme.of(context).textTheme.display1),
          ),
          const AspectRatio(
            aspectRatio: 1,
            child: SortVisualizer()
          ),
          const SortButton(),
          const SortSpeed(),
        ],
      ),
    );
  }
}
