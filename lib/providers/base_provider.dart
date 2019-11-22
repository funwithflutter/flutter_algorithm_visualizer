import 'package:algorithms_visualizer/utils/wait.dart';
import 'package:flutter/material.dart';

abstract class BaseProvider extends ChangeNotifier {
  double _executionSpeed = 0.5;
  double get executionSpeed => _executionSpeed;
  set executionSpeed(double speed) {
    if (speed > 1.0) {
      _executionSpeed = 1;
      return;
    }
    if (speed < 0) {
      _executionSpeed = 0;
      return;
    }
    _executionSpeed = speed;
    render();
  }

  @protected
  void render() {
    notifyListeners();
  }

  @protected
  Future pause() async {
    await wait(speed: executionSpeed);
  }
}
