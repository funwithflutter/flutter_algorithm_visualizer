import 'package:algorithms_visualizer/providers/sort/bubble_sort_provider.dart';
import 'package:algorithms_visualizer/ux/widgets/sort/sort_visualizer.dart';
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 64,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Text('Bubble Sort',
                style: Theme.of(context).textTheme.display1),
          ),
          FlatButton(
            child: const Text('click'),
            onPressed: () {
              BubbleSortProvider().sort();
            },
          ),
          const Expanded(
            child: SortVisualizer(),
          )
          // Expanded(
          //   child: Stack(
          //     alignment: AlignmentDirectional.topStart,
          //     children: <Widget>[
          //       // Positioned.(child: Text("hello")),
          //       Positioned(top:0, left: 0, child: Text('asdf'),)
          //     ],
          //   ),
          // )
          // SortVisualizer(),
          // Expanded(
          //   child: Stack(
          //     children: <Widget>[
          //       // Positioned(
          //       //     left: 0,
          //       //     top: 0,
          //       //     height: 100,
          //       //     child: SizedBox(
          //       //         height: 100, width: 100, child: Text('hello'))),
          //       // Positioned(bottom: 0,left:0,child: Text('hello')),
          //       // Text('hello'),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
