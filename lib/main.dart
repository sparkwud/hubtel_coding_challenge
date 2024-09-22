import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        textTheme: GoogleFonts.nunitoSansTextTheme(),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const Scaffold(
        body: Center(
          child: Text('Hello Wold!'),
        ),
      ),
    );
  }
}
