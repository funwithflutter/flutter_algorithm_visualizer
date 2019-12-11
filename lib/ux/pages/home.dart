import 'package:algorithms_visualizer/providers/search/binary_search_provider.dart';
import 'package:algorithms_visualizer/providers/search/linear_search_provider.dart';
import 'package:algorithms_visualizer/providers/sort/bubble_sort_provider.dart';
import 'package:algorithms_visualizer/providers/sort/insertion_sort_provider.dart';
import 'package:algorithms_visualizer/ux/pages/search_page.dart';
import 'package:algorithms_visualizer/ux/pages/sort_page.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController = PageController(keepPage: false);

  var page = 0.0;

  void _updateIndicator(int pageNumber) {
    setState(() {
      page = pageNumber.toDouble();
    });
  }

  var pages = [
    const SearchPage<LinearSearchProvider>(title: 'Linear Search'),
    const SearchPage<BinarySearchProvider>(title: 'Binary Search'),
    const SortPage<BubbleSortProvider>(title: 'Bubble Sort'),
    const SortPage<InsertionSortProvider>(title: 'Insertion Sort'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: PageView.builder(
            controller: pageController,
            itemCount: pages.length,
            onPageChanged: (page) {
              _updateIndicator(page);
            },
            itemBuilder: (context, index) {
              return pages[index];
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: DotsIndicator(
            dotsCount: pages.length,
            position: page,
            decorator: DotsDecorator(
              activeColor: Colors.red,
              spacing: const EdgeInsets.symmetric(horizontal: 12),
              size: const Size(10, 10),
              activeSize: const Size(14, 14),
            ),
          ),
        ),
      ],
    );
  }
}
