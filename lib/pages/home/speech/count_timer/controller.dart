import 'dart:async';
import 'package:flutter/foundation.dart';

class CountdownController extends ValueNotifier<CountdownState> {
  Timer? _timer;

  CountdownController({int initialSeconds = 120 * 60}) : super(CountdownState(initialSeconds));

  void start() {
    if (_timer != null || value.totalSeconds <= 0) return;

    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (value.isPaused) return;
      if (value.totalSeconds > 0) {
        value = value.copyWith(totalSeconds: value.totalSeconds - 1);
      } else {
        timer.cancel();
        _timer = null;
      }
    });
  }

  void pause() {
    value = value.copyWith(isPaused: true);
    _timer?.cancel();
    _timer = null;
  }

  void resume() {
    value = value.copyWith(isPaused: false);
    start(); // Restart the timer if it's not already running
  }

  void reset({int initialSeconds = 120 * 60}) {
    value = CountdownState(initialSeconds);
    _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }
}

class CountdownState {
  final int totalSeconds;
  final bool isPaused;

  CountdownState(this.totalSeconds, [this.isPaused = false]);

  CountdownState copyWith({int? totalSeconds, bool? isPaused}) {
    return CountdownState(
      totalSeconds ?? this.totalSeconds,
      isPaused ?? this.isPaused,
    );
  }

  String format() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    int minutes = totalSeconds ~/ 60;
    int secs = totalSeconds % 60;
    return '${twoDigits(minutes)}:${twoDigits(secs)}';
  }

}
