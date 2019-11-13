import 'package:algorithms_visualizer/models/sort_model.dart';
import 'package:algorithms_visualizer/providers/sort/sort_provider.dart';

class BubbleSortProvider extends SortProvider {
  @override
  void sort() {
    super.sort();
    _startSort(numbers);
  }

  void _startSort(List<SortModel> list) {
    var sorted = false;
    var counter = 0;

    while (!sorted) {
      sorted = true;
      for (var i = 0; i < length - 1 - counter; i++) {
        if (list[i].value > list[i + 1].value) {
          final tmp = list[i];
          list[i] = list[i + 1];
          list[i + 1] = tmp;
          sorted = false;
        }
      }
      counter++;
    }
    list.forEach(_printValue);
  }

  void _printValue(SortModel val) {
    print(val.value);
  }
}
