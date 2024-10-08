import 'package:flutter/material.dart';
import 'package:hubtel_coding_challenge/utils/app_palette.dart';

class SendNewButton extends StatelessWidget {
  const SendNewButton({
    super.key,
    required bool showFab,
    required Duration animationDuration,
    required this.onPressed,
  })  : _showFab = showFab,
        _animationDuration = animationDuration;

  final bool _showFab;
  final Duration _animationDuration;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: _showFab ? Offset.zero : const Offset(0, 2),
      duration: _animationDuration,
      child: AnimatedOpacity(
        opacity: _showFab ? 1 : 0,
        duration: _animationDuration,
        child: FloatingActionButton.extended(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          onPressed: onPressed,
          backgroundColor: AppPalette.teal,
          icon: const Icon(
            Icons.add_circle,
            color: Colors.white,
            size: 30,
          ),
          label: const Text(
            'SEND NEW',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
