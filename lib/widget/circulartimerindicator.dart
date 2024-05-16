import 'package:flutter/material.dart';

class CircularTimerButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isRunning;
  final int currentTime;
  final int focusTime;

  const CircularTimerButton({
    required this.onPressed,
    required this.isRunning,
    required this.currentTime,
    required this.focusTime,
  });

  @override
  Widget build(BuildContext context) {
    double progress = currentTime / focusTime;

    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 10,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(
                isRunning ? Colors.white : Colors.green,
              ),
            ),
          ),
          Icon(
            isRunning ? Icons.pause : Icons.play_arrow,
            size: 60,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}