import 'package:flutter/material.dart';

class EditSongScreen extends StatefulWidget {
  final Map<String, String> song;
  final Function(Map<String, String>) onSongUpdated;

  const EditSongScreen({
    super.key,
    required this.song,
    required this.onSongUpdated,
  });

  @override
  State<EditSongScreen> createState() => _EditSongScreenState();
}

class _EditSongScreenState extends State<EditSongScreen> {
  late TextEditingController titleController;
  late TextEditingController artistController;
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

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.song["title"]);
    artistController = TextEditingController(text: widget.song["artist"]);
    selectedGenre = widget.song["genre"];
  }

  void updateSong() {
    if (titleController.text.isEmpty ||
        artistController.text.isEmpty ||
        selectedGenre == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    final updatedSong = {
      "title": titleController.text,
      "artist": artistController.text,
      "genre": selectedGenre!,
      "streams": widget.song["streams"] ?? "0",
    };

    widget.onSongUpdated(updatedSong);
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
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Edit Song"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
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
            const SizedBox(height: 15),
            TextField(
              controller: artistController,
              decoration: const InputDecoration(
                labelText: "Artist Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            DropdownButtonFormField<String>(
              value: selectedGenre,
              decoration: const InputDecoration(
                labelText: "Genre",
                border: OutlineInputBorder(),
              ),
              items: genres.map((genre) {
                return DropdownMenuItem(
                  value: genre,
                  child: Text(genre),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedGenre = value;
                });
              },
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: updateSong,
                icon: const Icon(Icons.save),
                label: const Text("Save Changes"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}