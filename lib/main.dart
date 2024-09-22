import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hubtel_coding_challenge/components/main_container.dart';
import 'package:hubtel_coding_challenge/utils/app_palette.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hubtel Coding Challenge',
      theme: ThemeData(
        // update app font to match design
        textTheme: GoogleFonts.nunitoSansTextTheme(),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(backgroundColor: AppPalette.lightGray),
      ),
      home: const MainContainer(),
    );
  }
}
