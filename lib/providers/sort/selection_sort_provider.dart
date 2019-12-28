import 'package:algorithms_visualizer/models/sort_model.dart';
import 'package:algorithms_visualizer/providers/sort/sort_provider.dart';

class SelectionSortProvider extends SortProvider {
  @override
  void sort() {
    super.sort();
    _startSort(numbers);
  }

  Future _startSort(List<SortModel> list) async {
    for (var currentIndex = 0;
        currentIndex <= list.length - 1;
        currentIndex++) {
      var smallestIndex = currentIndex;
      await _markSmallestAndRender(smallestIndex);
      for (var i = currentIndex + 1; i < list.length; i++) {
        await _markInterestedAndRender(i);
        if (list[i].value < list[smallestIndex].value) {
          _resetStateAndRender(smallestIndex);
          smallestIndex = i;
          await _markSmallestAndRender(i);
        } else {
          await _resetStateAndRender(i);
        }
      }
      _markSortedAndRender(smallestIndex);
      final tmp = list[currentIndex];
      list[currentIndex] = list[smallestIndex];
      list[smallestIndex] = tmp;
    }

    setStateToSortedAndRender();
    return list;
  }

  Future _resetStateAndRender(int index) async {
    markNodeAsNotSorted(index);
    render();
    pause();
  }

  Future _markInterestedAndRender(int index) async {
    markNodeForSorting(index);
    render();
    await pause();
  }

  Future _markSmallestAndRender(int index) async {
    markNodeAsPivot(index);
    render();
    await pause();
  }

  Future _markSortedAndRender(int index) async {
    markNodeAsSorted(index);
    render();
    await pause();
  }
}
