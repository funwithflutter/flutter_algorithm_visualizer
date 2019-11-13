import 'package:flutter/material.dart';

enum SearchState { open, discard, search, searched, found }

class SearchModel {
  SearchModel(this.value)
      : state = SearchState.open,
        color = Colors.black54,
        key = GlobalKey();

  final int value;
  SearchState state;
  Color color;
  GlobalKey key;

  void reset() {
    state = SearchState.open;
    color = Colors.black54;
  }

  void potential() {
    state = SearchState.search;
    color = Colors.blue;
  }

  void discard() {
    state = SearchState.discard;
    color = Colors.red;
  }

  void found() {
    state = SearchState.found;
    color = Colors.green;
  }

  void searched() {
    state = SearchState.searched;
  }
}
