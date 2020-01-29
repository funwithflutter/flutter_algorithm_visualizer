import 'package:algorithms_visualizer/providers/search/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchSpeed<T extends SearchProvider> extends StatelessWidget {
  const SearchSpeed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Search Speed', style: Theme.of(context).textTheme.caption),
        Consumer<T>(
          builder: (context, provider, child) {
            return Container(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Slider(
                value: provider.executionSpeed,
                onChanged: (value) => provider.executionSpeed = value,
              ),
            );
          },
        ),
      ],
    );
  }
}
