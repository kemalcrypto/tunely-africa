import 'package:flutter/material.dart';

class UploadSongScreen extends StatefulWidget {
  final Function(Map<String, String>) onSongUploaded;

  const UploadSongScreen({super.key, required this.onSongUploaded});

  @override
  State<UploadSongScreen> createState() => _UploadSongScreenState();
}

class _UploadSongScreenState extends State<UploadSongScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController artistController = TextEditingController();
  String? selectedGenre;

  final List<String> genres = [
    "Afrobeats",
    "Bongo Flava",
    "Amapiano",
    "Hip Hop",
    "R&B",
    "Gospel",
    "Dancehall",
  ];

  void uploadSong() {
    if (titleController.text.isEmpty ||
        artistController.text.isEmpty ||
        selectedGenre == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    final newSong = {
      "title": titleController.text,
      "artist": artistController.text,
      "genre": selectedGenre!,
      "streams": "0",
    };

    widget.onSongUploaded(newSong);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    titleController.dispose();
    artistController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Song"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Song Title",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: artistController,
              decoration: const InputDecoration(
                labelText: "Artist Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedGenre,
              decoration: const InputDecoration(
                labelText: "Genre",
                border: OutlineInputBorder(),
              ),
              items: genres.map((genre) {
                return DropdownMenuItem(value: genre, child: Text(genre));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedGenre = value;
                });
              },
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: uploadSong,
                icon: const Icon(Icons.upload),
                label: const Text("Upload Song"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}