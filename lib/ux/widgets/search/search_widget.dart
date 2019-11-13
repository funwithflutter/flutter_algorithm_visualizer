import 'package:algorithms_visualizer/models/search_model.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key key, this.number}) : super(key: key);

  final SearchModel number;

  @override
  Widget build(BuildContext context) {
    double fontSize = 20;
    if (number.state == SearchState.search) {
      fontSize = 42;
    } else if (number.state == SearchState.found) {
      fontSize = 42;
    } else if (number.state == SearchState.searched) {
      fontSize = 20;
    }
    return AnimatedContainer(
      key: number.key,
      duration: const Duration(milliseconds: 900),
      curve: Curves.ease,
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: (number.state == SearchState.found)
            ? Border.all(
                color: Colors.green,
              )
            : null,
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      ),
      child: AnimatedDefaultTextStyle(
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
        style: TextStyle(
          fontSize: fontSize,
          decoration: (number.state == SearchState.discard)
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          decorationStyle: TextDecorationStyle.solid,
          decorationThickness: 1.7,
          color: number.color,
        ),
        child: Center(
          child: Text(
            number.value.toString(),
          ),
        ),
      ),
    );
  }
}
