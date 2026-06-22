import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/splash_screen.dart';

void main() {
  runApp(const TunelyAfricaApp());
}

class TunelyAfricaApp extends StatelessWidget {
  const TunelyAfricaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tunely Africa',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,

        textTheme: GoogleFonts.poppinsTextTheme(),

        scaffoldBackgroundColor: const Color(0xFF050505),

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1DB954),
          brightness: Brightness.dark,
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF050505),
          elevation: 0,
          centerTitle: true,
        ),
      ),

      home: const SplashScreen(),
    );
  }
}