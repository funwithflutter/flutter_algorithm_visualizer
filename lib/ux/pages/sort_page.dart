import 'package:algorithms_visualizer/providers/sort/sort_provider.dart';
import 'package:algorithms_visualizer/ux/widgets/sort/sort_speed.dart';
import 'package:algorithms_visualizer/ux/widgets/sort/sort_visualizer.dart';
import 'package:algorithms_visualizer/ux/widgets/sort/sort_button.dart';
import 'package:flutter/material.dart';

class SortPage<T extends SortProvider> extends StatelessWidget {
  const SortPage({Key key, @required this.title})
      : assert(title != null),
        super(key: key);

  final String title;

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
            child: Text(title,
                style: Theme.of(context).textTheme.display1),
          ),
          const AspectRatio(aspectRatio: 1, child: SortVisualizer<T>()),
          SortButton<T>(),
          SortSpeed<T>(),
        ],
      ),
    );
  }
}
