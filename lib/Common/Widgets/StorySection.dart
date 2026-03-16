import 'package:flutter/material.dart';
import 'package:klaket_cine/Common/Widgets/SectionHeader.dart';

class StorySection extends StatelessWidget {
  final String story;

  const StorySection({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // The SectionHeader is now inside the StorySection itself.
        const SectionHeader(title: 'القصة'),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            story.isNotEmpty ? story : 'لا تتوفر حاليا قصة',
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
        ),
      ],
    );
  }
}
