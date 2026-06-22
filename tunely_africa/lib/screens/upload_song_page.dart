import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class UploadSongPage extends StatefulWidget {
  const UploadSongPage({super.key});

  @override
  State<UploadSongPage> createState() => _UploadSongPageState();
}

class _UploadSongPageState extends State<UploadSongPage> {
  final TextEditingController songTitleController = TextEditingController();
  final TextEditingController artistNameController = TextEditingController();

  String selectedGenre = 'Afrobeats';
  String priceType = 'Free';

  XFile? coverImage;
  PlatformFile? audioFile;

  final List<String> genres = [
    'Afrobeats',
    'Bongo Flava',
    'Amapiano',
    'Hip Hop',
    'R&B',
    'Gospel',
    'Singeli',
    'Dancehall',
  ];

  Future<void> pickCoverImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        coverImage = image;
      });
    }
  }

  Future<void> pickAudioFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );

    if (result != null) {
      setState(() {
        audioFile = result.files.first;
      });
    }
  }

  void uploadSong() {
    if (songTitleController.text.isEmpty ||
        artistNameController.text.isEmpty ||
        coverImage == null ||
        audioFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tafadhali jaza taarifa zote za wimbo'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Song uploaded successfully'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050505),
      appBar: AppBar(
        backgroundColor: const Color(0xFF050505),
        elevation: 0,
        title: const Text(
          'Upload Song',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            GestureDetector(
              onTap: pickCoverImage,
              child: Container(
                height: 210,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF101010),
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: Colors.greenAccent, width: 1),
                ),
                child: coverImage == null
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_photo_alternate,
                            color: Colors.greenAccent,
                            size: 55,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Upload Cover Image',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      )
                    : Center(
                        child: Text(
                          coverImage!.name,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
              ),
            ),

            const SizedBox(height: 22),

            _inputField(
              controller: songTitleController,
              label: 'Song Title',
              icon: Icons.music_note,
            ),

            const SizedBox(height: 16),

            _inputField(
              controller: artistNameController,
              label: 'Artist Name',
              icon: Icons.person,
            ),

            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF101010),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedGenre,
                  dropdownColor: const Color(0xFF101010),
                  isExpanded: true,
                  iconEnabledColor: Colors.greenAccent,
                  style: const TextStyle(color: Colors.white),
                  items: genres.map((genre) {
                    return DropdownMenuItem(
                      value: genre,
                      child: Text(genre),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedGenre = value!;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 18),

            GestureDetector(
              onTap: pickAudioFile,
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFF101010),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.greenAccent),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.audio_file, color: Colors.greenAccent),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        audioFile == null
                            ? 'Choose Audio File'
                            : audioFile!.name,
                        style: const TextStyle(color: Colors.white70),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: _priceButton('Free'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _priceButton('Premium'),
                ),
              ],
            ),

            const SizedBox(height: 28),

            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: uploadSong,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text(
                  'UPLOAD SONG',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF101010),
        prefixIcon: Icon(icon, color: Colors.greenAccent),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white54),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.white12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.greenAccent),
        ),
      ),
    );
  }

  Widget _priceButton(String value) {
    final bool active = priceType == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          priceType = value;
        });
      },
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: active ? Colors.greenAccent : const Color(0xFF101010),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.greenAccent),
        ),
        child: Center(
          child: Text(
            value,
            style: TextStyle(
              color: active ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}