import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hubtel_coding_challenge/utils/app_drawables.dart';
import 'package:hubtel_coding_challenge/utils/app_palette.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        fillColor: AppPalette.lightGray,
        filled: true,
        hintStyle: const TextStyle(color: AppPalette.textGray),
        prefixIcon: Container(
          padding: const EdgeInsets.all(16),
          child: SvgPicture.asset(AppDrawables.icSearch),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
