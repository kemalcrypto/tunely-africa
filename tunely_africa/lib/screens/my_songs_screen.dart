import 'package:flutter/material.dart';

class MySongsScreen extends StatefulWidget {
  const MySongsScreen({super.key});

  @override
  State<MySongsScreen> createState() => _MySongsScreenState();
}

class _MySongsScreenState extends State<MySongsScreen> {
  List<Map<String, String>> songs = [
    {
      'title': 'African Love',
      'artist': 'Kemal Artist',
      'genre': 'Afrobeat',
    },
    {
      'title': 'Dar Sound',
      'artist': 'Tunely Star',
      'genre': 'Bongo Flava',
    },
  ];

  void deleteSong(int index) {
    setState(() {
      songs.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050505),
      appBar: AppBar(
        backgroundColor: const Color(0xFF050505),
        foregroundColor: Colors.white,
        title: const Text('My Songs'),
      ),
      body: songs.isEmpty
          ? const Center(
              child: Text(
                'No songs uploaded yet',
                style: TextStyle(color: Colors.white54),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(18),
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 28,
                        backgroundColor: Color(0xFF1DB954),
                        child: Icon(
                          Icons.music_note,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 14),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              song['title']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${song['artist']} • ${song['genre']}',
                              style: const TextStyle(
                                color: Colors.white54,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),

                      IconButton(
                        onPressed: () => deleteSong(index),
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}