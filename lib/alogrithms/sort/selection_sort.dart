/// This function is not used within the application
/// It only serves to illustrate the relevant operation

List<int> selectionSort(List<int> list) {
  for (var currentIndex = 0; currentIndex <= list.length - 1; currentIndex++) {
    var smallestIndex = currentIndex;
    for (var i = currentIndex + 1; i < list.length; i++) {
      if (list[i] < list[smallestIndex]) {
        smallestIndex = i;
      }
    }
    final tmp = list[currentIndex];
    list[currentIndex] = list[smallestIndex];
    list[smallestIndex] = tmp;
  }

  return list;
}
