import 'package:after_layout/after_layout.dart';
import 'package:algorithms_visualizer/models/search_model.dart';
import 'package:algorithms_visualizer/providers/search/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchIndicator<T extends SearchProvider> extends StatefulWidget {
  const SearchIndicator({
    Key key,
    @required this.parentKey,
  }) : super(key: key);

  final GlobalKey parentKey;
  @override
  _SearchIndicatorState<T> createState() => _SearchIndicatorState<T>();
}

class _SearchIndicatorState<T extends SearchProvider>
    extends State<SearchIndicator<T>>
    with AfterLayoutMixin<SearchIndicator<T>> {
  var _position = Offset.zero;

  @override
  void afterFirstLayout(BuildContext context) {
    final numbers = Provider.of<T>(context, listen: false).numbers;
    setState(() {
      _position = _getIndicatorOffset(numbers[numbers.length ~/ 2]);
    });
  }

  Offset _getIndicatorOffset(SearchModel number) {
    var pos = Offset.zero;
    try {
      final RenderBox rObject = number.key.currentContext.findRenderObject();
      final RenderBox parentObject =
          widget.parentKey.currentContext.findRenderObject();
      final parentPos = parentObject.localToGlobal(const Offset(0, 0));
      pos = -rObject.globalToLocal(parentPos);
    } catch (e) {
      print(e);
    }
    return pos;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (_, searchProvider, child) {
        for (var number in searchProvider.numbers) {
          if (number.state.value == SearchState.search) {
            _position = _getIndicatorOffset(number);
            break;
          }
        }
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 400),
          curve: Curves.ease,
          left: _position.dx,
          top: _position.dy,
          child: Visibility(visible: searchProvider.isSearching, child: child),
        );
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
      ),
    );
  }
}
