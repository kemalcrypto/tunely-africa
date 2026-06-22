import 'package:flutter/material.dart';
import '../models/song_model.dart';

class MusicPlayerScreen extends StatefulWidget {
  final SongModel song;

  const MusicPlayerScreen({
    super.key,
    required this.song,
  });

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  double progress = 0.35;
  bool isPlaying = true;
  bool isFavorite = false;
  bool isRepeat = false;
  bool isShuffle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050505),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(22, 45, 22, 25),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0A3D22),
              Color(0xFF050505),
              Color(0xFF050505),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            topBar(context),
            const SizedBox(height: 35),
            coverImage(),
            const SizedBox(height: 30),
            songInfo(),
            const SizedBox(height: 22),
            progressBar(),
            const SizedBox(height: 25),
            controls(),
            const SizedBox(height: 25),
            extraControls(),
          ],
        ),
      ),
    );
  }

  Widget topBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        circleButton(
          icon: Icons.keyboard_arrow_down_rounded,
          onTap: () => Navigator.pop(context),
        ),
        const Text(
          'NOW PLAYING',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 13,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        circleButton(
          icon: Icons.more_vert_rounded,
          onTap: () {},
        ),
      ],
    );
  }

  Widget coverImage() {
    return Container(
      width: double.infinity,
      height: 330,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(34),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1DB954).withOpacity(0.22),
            blurRadius: 35,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(34),
        child: Image.asset(
          widget.song.cover,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget songInfo() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.song.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                widget.song.artist,
                style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? const Color(0xFF1DB954) : Colors.white70,
            size: 32,
          ),
        ),
      ],
    );
  }

  Widget progressBar() {
    return Column(
      children: [
        Slider(
          value: progress,
          activeColor: const Color(0xFF1DB954),
          inactiveColor: Colors.white24,
          onChanged: (value) {
            setState(() {
              progress = value;
            });
          },
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('1:20', style: TextStyle(color: Colors.white54, fontSize: 12)),
            Text('3:45', style: TextStyle(color: Colors.white54, fontSize: 12)),
          ],
        ),
      ],
    );
  }

  Widget controls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.skip_previous_rounded,
            color: Colors.white,
            size: 45,
          ),
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            setState(() {
              isPlaying = !isPlaying;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: const BoxDecoration(
              color: Color(0xFF1DB954),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
              color: Colors.black,
              size: 46,
            ),
          ),
        ),
        const SizedBox(width: 20),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.skip_next_rounded,
            color: Colors.white,
            size: 45,
          ),
        ),
      ],
    );
  }

  Widget extraControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        smallControl(
          icon: Icons.shuffle_rounded,
          active: isShuffle,
          onTap: () {
            setState(() {
              isShuffle = !isShuffle;
            });
          },
        ),
        const SizedBox(width: 35),
        smallControl(
          icon: Icons.repeat_rounded,
          active: isRepeat,
          onTap: () {
            setState(() {
              isRepeat = !isRepeat;
            });
          },
        ),
      ],
    );
  }

  Widget circleButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white10),
        ),
        child: Icon(icon, color: Colors.white, size: 26),
      ),
    );
  }

  Widget smallControl({
    required IconData icon,
    required bool active,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        color: active ? const Color(0xFF1DB954) : Colors.white54,
        size: 28,
      ),
    );
  }
}