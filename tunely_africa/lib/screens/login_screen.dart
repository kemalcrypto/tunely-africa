import 'package:flutter/material.dart';
import 'artist_dashboard.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void openDashboard(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const ArtistDashboard(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final pass = TextEditingController();

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF050505),
              Color(0xFF052E16),
              Color(0xFF050505),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Icon(
                  Icons.music_note_rounded,
                  size: 90,
                  color: Color(0xFF1DB954),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Tunely Africa',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Feel the African Sound',
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 40),

                TextField(
                  controller: email,
                  style: const TextStyle(color: Colors.white),
                  decoration: inputDecoration('Email', Icons.email),
                ),
                const SizedBox(height: 16),

                TextField(
                  controller: pass,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: inputDecoration('Password', Icons.lock),
                ),
                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () => openDashboard(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1DB954),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                const Text(
                  'Artist & Music Platform',
                  style: TextStyle(color: Colors.white54),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white.withOpacity(0.08),
      prefixIcon: Icon(icon, color: Colors.white70),
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white54),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
    );
  }
}