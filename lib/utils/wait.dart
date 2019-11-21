import 'dart:ui';

Future sleepSum(int valueOne, int valueTwo) {
  return Future.delayed(const Duration(seconds: 1), () => valueOne + valueTwo);
}

Future wait({double speed = 0.5}) {
  final milliseconds = lerpDouble(100, 2000, speed).toInt();
  return Future.delayed(Duration(milliseconds: milliseconds));
}
