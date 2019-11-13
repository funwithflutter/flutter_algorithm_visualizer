import 'package:algorithms_visualizer/models/sort_model.dart';
import 'package:flutter/material.dart';

class SortProvider extends ChangeNotifier {
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

  @mustCallSuper
  void sort() {
    reset();
  }

  @protected
  int get length => numbers.length;

  @protected
  void reset() {}
}
