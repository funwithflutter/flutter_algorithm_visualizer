import 'package:flutter/material.dart';
import 'package:algorithms_visualizer/models/search_model.dart';

abstract class SearchProvider extends ChangeNotifier {
  final List<SearchModel> numbers = [
    SearchModel(0),
    SearchModel(1),
    SearchModel(4),
    SearchModel(11),
    SearchModel(19),
    SearchModel(22),
    SearchModel(34),
    SearchModel(35),
    SearchModel(38),
    SearchModel(39),
    SearchModel(44),
    SearchModel(46),
    SearchModel(47),
    SearchModel(49),
    SearchModel(57),
    SearchModel(62),
    SearchModel(69),
    SearchModel(74),
  ];

  bool isSearching = false;
  int position = -2;

  @mustCallSuper
  void search({int value = 34}) {
    reset();
    isSearching = true;
  }

  @protected
  void reset() {
    isSearching = false;
    position = -2;
    for (var number in numbers) {
      number.reset();
    }
    notifyListeners();
  }

  @protected
  void potentialNode(int index) {
    numbers[index].potential();
    notifyListeners();
  }

  @protected
  void searchedNode(int index) {
    numbers[index].searched();
    notifyListeners();
  }

  @protected
  void discardNode(int index) {
    numbers[index].discard();
    notifyListeners();
  }

  @protected
  void discardNodes(int left, int right) {
    for (var index = left; index <= right; index++) {
      numbers[index].discard();
    }
    notifyListeners();
  }

  @protected
  void foundNode(int index) {
    isSearching = false;
    numbers[index].found();
    position = index;
    notifyListeners();
  }

  @protected
  void nodeNotFound() {
    isSearching = false;
    position = -1;
    notifyListeners();
  }

  // void setNumbers(List<NumberModel> list) {
  //   numbers = list;
  // }
}
