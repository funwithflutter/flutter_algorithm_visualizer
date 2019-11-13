import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:algorithms_visualizer/providers/search/linear_search_provider.dart';
import 'package:algorithms_visualizer/providers/search/binary_search_provider.dart';
import 'package:algorithms_visualizer/providers/sort/bubble_sort_provider.dart';
import 'package:algorithms_visualizer/ux/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Algorithms',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              builder: (_) => LinearSearchProvider(),
            ),
            ChangeNotifierProvider(
              builder: (_) => BinarySearchProvider(),
            ),
            ChangeNotifierProvider(
              builder: (_) => BubbleSortProvider(),
            )
          ],
          child: const Home(),
        ),
      ),
    );
  }
}
