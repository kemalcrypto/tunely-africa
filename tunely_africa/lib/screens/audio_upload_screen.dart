import 'package:flutter/material.dart';

class AudioUploadScreen extends StatefulWidget {
  const AudioUploadScreen({super.key});

  @override
  State<AudioUploadScreen> createState() => _AudioUploadScreenState();
}

class _AudioUploadScreenState extends State<AudioUploadScreen> {
  final TextEditingController audioController = TextEditingController();

  List<String> audioFiles = [];

  void addAudio() {
    if (audioController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter audio file name")),
      );
      return;
    }

    setState(() {
      audioFiles.add(audioController.text);
      audioController.clear();
    });
  }

  void deleteAudio(int index) {
    setState(() {
      audioFiles.removeAt(index);
    });
  }

  @override
  void dispose() {
    audioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Audio Uploads"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: audioController,
              decoration: const InputDecoration(
                labelText: "Audio file name mfano: my_song.mp3",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: addAudio,
                icon: const Icon(Icons.upload_file),
                label: const Text("Add Audio"),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: audioFiles.isEmpty
                  ? const Center(
                      child: Text("No audio uploaded yet"),
                    )
                  : ListView.builder(
                      itemCount: audioFiles.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: const Icon(
                              Icons.audiotrack,
                              color: Colors.green,
                            ),
                            title: Text(audioFiles[index]),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => deleteAudio(index),
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