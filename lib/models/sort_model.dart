enum SortState {
  open,
  sort,
  sorted,
}

class SortModel {
  SortModel(this.value) {
    state = SortState.open;
  }

  final int value;
  SortState state;
}
