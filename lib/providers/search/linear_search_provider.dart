import 'package:algorithms_visualizer/providers/search/search_provider.dart';
import 'package:algorithms_visualizer/utils/wait.dart';

class LinearSearchProvider extends SearchProvider {
  @override
  void search({int value = 34}) {
    super.search(value: value);
    _startSearch(value);
  }

  Future _startSearch(int target) async {
    for (var index = 0; index < numbers.length; index++) {
      potentialNode(index);
      await wait();
      if (numbers[index].value == target) {
        foundNode(index);
        return;
      } else {
        discardNode(index);
      }
    }
    nodeNotFound();
  }
}
