import 'package:flutter/material.dart';

import 'main_home_screen.dart';
import 'upload_song_page.dart';
import 'my_songs_screen.dart';

class ArtistDashboard extends StatefulWidget {
  const ArtistDashboard({super.key});

  @override
  State<ArtistDashboard> createState() => _ArtistDashboardState();
}

class _ArtistDashboardState extends State<ArtistDashboard> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    MainHomeScreen(),
    UploadSongPage(),
    MySongsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: const Color(0xFF0B0B0B),
        selectedItemColor: const Color(0xFF1DB954),
        unselectedItemColor: Colors.white54,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_upload_rounded),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music_rounded),
            label: 'My Songs',
          ),
        ],
      ),
    );
  }
}