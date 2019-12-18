import 'package:algorithms_visualizer/models/sort_model.dart';
import 'package:flutter/material.dart';

import '../base_provider.dart';

abstract class SortProvider extends BaseProvider {
  List<SortModel> numbers = [
    SortModel(22),
    SortModel(4),
    SortModel(38),
    SortModel(1),
    SortModel(11),
    SortModel(34),
    SortModel(19),
    SortModel(46),
    SortModel(0),
    SortModel(62),
    SortModel(74),
    SortModel(35),
    SortModel(39),
    SortModel(44),
    SortModel(49),
    SortModel(47),
    SortModel(57),
    SortModel(69),
  ];

  bool _isSorting = false;
  bool get isSorting => _isSorting;

  bool _isSorted = false;
  bool get isSorted => _isSorted;

  @mustCallSuper
  void sort() {
    reset();
    _isSorting = true;
  }

  @protected
  void reset() {
    _isSorting = false;
    _isSorted = false;
    for (final number in numbers) {
      number.reset();
    }
    numbers.shuffle();
    notifyListeners();
  }

  @protected
  void markNodeAsNotSorted(int index) {
    numbers[index].reset();
  }

  @protected
  void markNodesAsNotSorted(int left, int right) {
    if (left < 0 || right > numbers.length - 1 || left > right) {
      print('left: $left, right: $right');
      return;
    }
    for (var index = left; index <= right; index++) {
      numbers[index].reset();
    }
  }

  @protected
  void markNodeForSorting(int index) {
    if (index < 0 || index >= numbers.length) {
      return;
    }
    numbers[index].sort();
  }

  @protected
  void markNodesForSorting(int indexOne, int indexTwo) {
    numbers[indexOne].sort();
    numbers[indexTwo].sort();
  }

  @protected
  void markNodeAsSorted(int index) {
    numbers[index].sorted();
  }

  @protected
  void markNodesAsSorted(int left, int right) {
    for (var i = left; i <= right; i++) {
      numbers[i].sorted();
    }
  }

  @protected
  void markNodeAsPivot(int index) {
    numbers[index].pivot();
  }

  @protected
  void setStateToSorted() {
    _isSorting = false;
    _isSorted = true;
  }
}
