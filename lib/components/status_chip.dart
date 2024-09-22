import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hubtel_coding_challenge/utils/app_drawables.dart';
import 'package:hubtel_coding_challenge/utils/app_palette.dart';

class StatusChip extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final String icon;
  final Color textColor;

  const StatusChip._({
    required this.message,
    required this.backgroundColor,
    required this.icon,
    required this.textColor,
  });

// create variations of the status chip for easy usage
  factory StatusChip.success() {
    return const StatusChip._(
      message: "Success",
      backgroundColor: AppPalette.greenBackground,
      textColor: AppPalette.greenText,
      icon: AppDrawables.icCheck,
    );
  }

  factory StatusChip.failure() {
    return const StatusChip._(
      message: "Failed",
      backgroundColor: AppPalette.redBackground,
      textColor: AppPalette.redText,
      icon: AppDrawables.icClose,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          const SizedBox(width: 5),
          Text(
            message,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w800,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
