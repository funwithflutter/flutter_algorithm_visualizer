/// This function is not used within the application
/// It only serves to illustrate the relevant operation

List<int> insertionSort(List<int> list) {
  for (var i = 0; i < list.length; i++) {
    for (var j = i; j > 0 && list[j] < list[j - 1]; j--) {
      final tmp = list[j];
      list[j] = list[j - 1];
      list[j - 1] = tmp;
    }
  }
  return list;
}
