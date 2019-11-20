import 'package:algorithms_visualizer/utils/wait.dart';
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

  bool _isSearching = false;
  int _position = -2;

  bool get isSearching => _isSearching;
  int get position => _position;

  double _sortSpeed = 0.5;
  double get sortSpeed => _sortSpeed;
  set sortSpeed(double speed) {
    if (speed > 1.0) {
      _sortSpeed = 1;
      return;
    }
    if (speed < 0) {
      _sortSpeed = 0;
      return;
    }
    _sortSpeed = speed;
    render();
  }

  @mustCallSuper
  void search({int value = 34}) {
    reset();
    _isSearching = true;
  }

  @protected
  void reset() {
    _isSearching = false;
    _position = -2;
    for (var number in numbers) {
      number.reset();
    }
    notifyListeners();
  }

  @protected
  Future pause() async {
    await wait(sortSpeed: sortSpeed);
  }

  @protected
  void render() {
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
    _isSearching = false;
    numbers[index].found();
    _position = index;
    notifyListeners();
  }

  @protected
  void nodeNotFound() {
    _isSearching = false;
    _position = -1;
    notifyListeners();
  }

  // void setNumbers(List<NumberModel> list) {
  //   numbers = list;
  // }
}
