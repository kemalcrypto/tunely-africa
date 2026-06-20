import 'package:flutter/material.dart';
import 'upload_song_screen.dart';
import 'edit_song_screen.dart';

class MySongsScreen extends StatefulWidget {
  const MySongsScreen({super.key});

  @override
  State<MySongsScreen> createState() => _MySongsScreenState();
}

class _MySongsScreenState extends State<MySongsScreen> {
  final TextEditingController searchController = TextEditingController();

  List<Map<String, String>> songs = [];

  String searchText = "";

  void addSong(Map<String, String> song) {
    setState(() {
      songs.add(song);
    });
  }

  void updateSong(int index, Map<String, String> updatedSong) {
    setState(() {
      songs[index] = updatedSong;
    });
  }

  void deleteSong(int index) {
    setState(() {
      songs.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredSongs = songs.where((song) {
      final title = song["title"]?.toLowerCase() ?? "";
      final artist = song["artist"]?.toLowerCase() ?? "";
      final query = searchText.toLowerCase();

      return title.contains(query) || artist.contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("My Songs"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.upload),
        label: const Text("Upload Song"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UploadSongScreen(
                onSongUploaded: addSong,
              ),
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search song or artist...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),

            const SizedBox(height: 16),

            Expanded(
              child: filteredSongs.isEmpty
                  ? const Center(
                      child: Text(
                        "No songs found. Upload your first song.",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredSongs.length,
                      itemBuilder: (context, index) {
                        final song = filteredSongs[index];
                        final realIndex = songs.indexOf(song);

                        return Card(
                          child: ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: Colors.green,
                              child: Icon(
                                Icons.music_note,
                                color: Colors.white,
                              ),
                            ),
                            title: Text(song["title"] ?? ""),
                            subtitle: Text(
                              "${song["artist"]} • ${song["genre"]} • ${song["streams"]} Streams",
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditSongScreen(
                                          song: song,
                                          onSongUpdated: (updatedSong) {
                                            updateSong(
                                              realIndex,
                                              updatedSong,
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    deleteSong(realIndex);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}