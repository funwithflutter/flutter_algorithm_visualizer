import 'package:algorithms_visualizer/providers/sort/insertion_sort_provider.dart';
import 'package:algorithms_visualizer/providers/sort/quick_sort_provider.dart';
import 'package:algorithms_visualizer/providers/sort/selection_sort_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:algorithms_visualizer/providers/search/linear_search_provider.dart';
import 'package:algorithms_visualizer/providers/search/binary_search_provider.dart';
import 'package:algorithms_visualizer/providers/sort/bubble_sort_provider.dart';
import 'package:algorithms_visualizer/ux/pages/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Algorithms',
      debugShowCheckedModeBanner: false,
      // showPerformanceOverlay: true,
      home: Scaffold(
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => LinearSearchProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => BinarySearchProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => BubbleSortProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => InsertionSortProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => QuickSortProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => SelectionSortProvider(),
            )
          ],
          child: Home(),
        ),
      ),
    );
  }
}
