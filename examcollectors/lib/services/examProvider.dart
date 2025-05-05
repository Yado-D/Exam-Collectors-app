import 'dart:async';
import 'package:flutter/material.dart';

class ExamTimerProvider with ChangeNotifier {
  late int _initialDuration;
  late int _remainingSeconds;
  Timer? _timer;
  bool _isRunning = false;
  bool _isFinished = false;
  DateTime? _pauseTime;
  int? _elapsedPauseSeconds;

  int get remainingMinutes => _remainingSeconds ~/ 60;
  bool get isRunning => _isRunning;
  bool get isFinished => _isFinished;

  String get formattedTime {
    final minutes = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void startTimer(int durationMinutes) {
    _initialDuration = durationMinutes * 60;
    _remainingSeconds = _initialDuration;
    _isFinished = false;
    _resumeTimer();
  }

  void _resumeTimer() {
    if (_isRunning) return;

    // Adjust for paused time if resuming
    if (_pauseTime != null && _elapsedPauseSeconds != null) {
      final pauseDuration = DateTime.now().difference(_pauseTime!).inSeconds;
      _remainingSeconds = _elapsedPauseSeconds! - pauseDuration;
      if (_remainingSeconds < 0) _remainingSeconds = 0;
    }

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        notifyListeners();
      } else {
        _isFinished = true;
        _isRunning = false;
        timer.cancel();
        notifyListeners();
      }
    });

    _isRunning = true;
    _pauseTime = null;
    _elapsedPauseSeconds = null;
    notifyListeners();
  }

  void pauseTimer() {
    if (!_isRunning) return;

    _timer?.cancel();
    _isRunning = false;
    _pauseTime = DateTime.now();
    _elapsedPauseSeconds = _remainingSeconds;
    notifyListeners();
  }

  void resetTimer() {
    _timer?.cancel();
    _remainingSeconds = _initialDuration;
    _isRunning = false;
    _isFinished = false;
    _pauseTime = null;
    _elapsedPauseSeconds = null;
    notifyListeners();
  }

  void get resume => _resumeTimer();

  int get initialDuration => _initialDuration;

  // New: Get elapsed time in seconds
  int get elapsedSeconds => _initialDuration - _remainingSeconds;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}