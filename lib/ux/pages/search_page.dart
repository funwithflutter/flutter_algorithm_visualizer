import 'package:algorithms_visualizer/providers/search/search_provider.dart';
import 'package:algorithms_visualizer/ux/widgets/search/search.dart';
import 'package:algorithms_visualizer/ux/widgets/search/search_indicator.dart';
import 'package:algorithms_visualizer/ux/widgets/search/search_message.dart';
import 'package:algorithms_visualizer/ux/widgets/search/search_speed.dart';
import 'package:algorithms_visualizer/ux/widgets/search/search_visualizer.dart';
import 'package:flutter/material.dart';

class SearchPage<T extends SearchProvider> extends StatelessWidget {
  SearchPage({Key key, @required this.title})
      : assert(title != null),
        super(key: key);

  final String title;


  @override
  Widget build(BuildContext context) {
  GlobalKey key = GlobalKey(debugLabel: title);
    return Stack(
      key: key,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const SizedBox(height: 24),
            //Below can not be constant
            Expanded(
              child: SearchVisualizer<T>(),
            ),
            SearchMessage<T>(),
            const SizedBox(height: 24),
            SearchSpeed<T>(),
            Search<T>(),
            const SizedBox(height: 24),
          ],
        ),
        SearchIndicator<T>(
          parentKey: key,
        ),
      ],
    );
  }
}
