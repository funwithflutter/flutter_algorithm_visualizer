import 'package:algorithms_visualizer/providers/search/search_provider.dart';
import 'package:algorithms_visualizer/ux/widgets/search/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchVisualizer<T extends SearchProvider> extends StatelessWidget {
  const SearchVisualizer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<T>(
        builder: (_, provider, __) {
          return Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              for (var number in provider.numbers)
                SearchWidget(
                  number: number,
                )
            ],
          );
        },
      ),
    );
  }
}
