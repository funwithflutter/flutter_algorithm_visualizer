/// This function is not used within the application
/// It only serves to illustrate the relevant operation

int linearSearch(List<int> list, int target) {
  for (var i = 0; i < list.length; i++) {
    if (list[i] == target) {
      return i;
    }
  }
  return -1;
}
