import 'package:algorithms_visualizer/models/search_model.dart';
import 'package:algorithms_visualizer/providers/search/search_provider.dart';
import 'package:algorithms_visualizer/utils/wait.dart';

class BinarySearchProvider extends SearchProvider {
  @override
  void search({int value = 34}) {
    super.search();
    _startBinarySearch(numbers, value);
  }

  Future<int> _startBinarySearch(List<SearchModel> list, int target) async {
    return _binarySearchHelper(list, target, 0, list.length - 1);
  }

  Future<int> _binarySearchHelper(
      List<SearchModel> list, int target, int left, int right) async {
    while (left <= right) {
      final middle = (left + right) ~/ 2;
      potentialNode(middle);
      await wait();
      final potentialMatch = list[middle].value;
      if (target == potentialMatch) {
        foundNode(middle);
        return middle;
      } else if (target < potentialMatch) {
        discardNodes(middle + 1, right);
        await wait();
        right = middle - 1;
      } else {
        discardNodes(left, middle - 1);
        await wait();
        left = middle + 1;
      }
      searchedNode(middle);
    }
    nodeNotFound();
    return -1; // not found
  }
}
