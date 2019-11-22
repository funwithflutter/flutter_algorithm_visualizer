/// This function is not used within the application
/// It only serves to illustrate the relevant operation

List<int> bubbleSort(List<int> list) {
  var sorted = false;
  var counter = 0;

  while (!sorted) {
    sorted = true;
    for (var i = 0; i < list.length - 1 - counter; i++) {
      if (list[i] > list[i + 1]) {
        final tmp = list[i];
        list[i] = list[i + 1];
        list[i + 1] = tmp;
        sorted = false;
      }
    }
    counter++;
  }
  return list;
}
