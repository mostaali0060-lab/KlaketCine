import 'dart:async';
import 'package:flutter/material.dart';
import 'package:klaket_cine/presentation/features/player/screens/loading_screen.dart';
import 'package:klaket_cine/presentation/features/series/screens/episode_screen.dart';

class EpisodePlayerLoader extends StatefulWidget {
  final Map<String, dynamic> episode;

  const EpisodePlayerLoader({super.key, required this.episode});

  @override
  State<EpisodePlayerLoader> createState() => _EpisodePlayerLoaderState();
}

class _EpisodePlayerLoaderState extends State<EpisodePlayerLoader> {
  @override
  void initState() {
    super.initState();
    // Simulate loading for 2 seconds
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => EpisodeScreen(episode: widget.episode),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const EpisodeLoadingScreen();
  }
}
