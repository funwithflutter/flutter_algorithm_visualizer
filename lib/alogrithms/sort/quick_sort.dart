List<int> quickSort(List<int> list) {
  return _helper(list, 0, list.length - 1);
}

List<int> _helper(List<int> list, int start, int end) {
  if (start >= end) {
    return list;
  }

  final pivot = start; // pivot pointer
  var leftP = start + 1; // left pointer
  var rightP = end; // right pointer

  while (rightP >= leftP) {
    if (list[leftP] > list[pivot] && list[rightP] < list[pivot]) {
      final tmp = list[leftP];
      list[leftP] = list[rightP];
      list[rightP] = tmp;
    }
    if (list[leftP] <= list[pivot]) {
      leftP++;
    }
    if (list[rightP] >= list[pivot]) {
      rightP--;
    }
  }

  final tmp = list[pivot];
  list[pivot] = list[rightP];
  list[rightP] = tmp;

  if (rightP - 1 - start < end - (rightP + 1)) {
    _helper(list, start, rightP - 1);
    _helper(list, rightP + 1, end);
  } else {
    _helper(list, rightP + 1, end);
    _helper(list, start, rightP - 1);
  }

  return list;
}
