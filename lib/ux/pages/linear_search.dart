import 'package:algorithms_visualizer/providers/search/linear_search_provider.dart';
import 'package:algorithms_visualizer/ux/widgets/search/search.dart';
import 'package:algorithms_visualizer/ux/widgets/search/search_message.dart';
import 'package:algorithms_visualizer/ux/widgets/search/search_speed.dart';
import 'package:algorithms_visualizer/ux/widgets/search/search_visualizer.dart';
import 'package:flutter/material.dart';

class LinearSearchPage extends StatelessWidget {
  const LinearSearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(
              height: 64,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Text(
                'Linear Search',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            const SizedBox(height: 24),
            const Expanded(
              child: SearchVisualizer<LinearSearchProvider>(),
            ),
            const SearchMessage<LinearSearchProvider>(),
            const SizedBox(height: 24),
            const SearchSpeed<LinearSearchProvider>(),
            const Search<LinearSearchProvider>(),
            const SizedBox(height: 24),
          ],
        ),
        // const SearchIndicator<LinearSearchProvider>(),
      ],
    );
  }
}
