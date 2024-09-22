import 'package:flutter/material.dart';

import '../utils/app_palette.dart';

class DateChip extends StatelessWidget {
  const DateChip({super.key, required this.date});

  final String date;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: AppPalette.lightGray,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        side: BorderSide(color: Colors.white),
      ),
      label: Text(
        date,
        style: const TextStyle(
          color: AppPalette.textGray,
          fontWeight: FontWeight.w800,
          fontSize: 10,
        ),
      ),
    );
  }
}
