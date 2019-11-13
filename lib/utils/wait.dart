Future sleepSum(int valueOne, int valueTwo) {
  return Future.delayed(
      const Duration(seconds: 1), () => valueOne + valueTwo);
}

Future wait() {
  return Future.delayed(const Duration(seconds: 1));
}
