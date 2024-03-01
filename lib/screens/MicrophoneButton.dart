import 'package:flutter/material.dart';

class MicrophoneButton extends StatelessWidget {
  final bool isListening;
  final VoidCallback onPressed;

  MicrophoneButton({required this.isListening, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(isListening ? Icons.mic_none : Icons.mic),
      backgroundColor: Colors.blue,
    );
  }
}
