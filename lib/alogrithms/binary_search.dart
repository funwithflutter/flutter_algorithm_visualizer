/// These functions are not used within the application
/// They only serve to illustrate the relevant operation

int binarySearch(List<int> list, int target) {
  return _binarySearchHelper(list, target, 0, list.length - 1);
}

int _binarySearchHelper(List<int> list, int target, int left, int right) {
  while (left <= right) {
    final middle = (left + right) ~/ 2;
    final potentialMatch = list[middle];
    if (target == potentialMatch) {
      return middle;
    } else if (target < potentialMatch) {
      right = middle - 1;
    } else {
      left = middle + 1;
    }
  }
  return -1;
}
