import 'package:flutter/material.dart';
import 'package:klaket_cine/core/constants/app_colors.dart';

class StorySection extends StatefulWidget {
  final Map<String, dynamic> details;

  const StorySection({super.key, required this.details});

  @override
  State<StorySection> createState() => _StorySectionState();
}

class _StorySectionState extends State<StorySection> {
  bool _isExpanded = false;
  static const int _maxLines = 3;

  @override
  Widget build(BuildContext context) {
    final story = widget.details['story'] as String?;

    if (story == null || story.isEmpty) {
      return _buildStoryWidget("لا تتوفر حاليا قصة", false);
    }

    // Use a LayoutBuilder to determine if the text will overflow
    return LayoutBuilder(builder: (context, constraints) {
      final span = TextSpan(
        text: story,
        style: const TextStyle(
            color: AppColors.textSecondary, fontSize: 15, height: 1.6),
      );
      final tp = TextPainter(
        maxLines: _maxLines,
        textAlign: TextAlign.start,
        textDirection: TextDirection.rtl,
        text: span,
      );
      tp.layout(maxWidth: constraints.maxWidth);
      final bool isOverflowing = tp.didExceedMaxLines;

      return _buildStoryWidget(story, isOverflowing);
    });
  }

  Widget _buildStoryWidget(String story, bool isOverflowing) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('القصة'),
        const SizedBox(height: 16),
        Text(
          story,
          style: const TextStyle(
              color: AppColors.textSecondary, fontSize: 15, height: 1.6),
          maxLines: _isExpanded ? null : _maxLines,
          overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
        ),
        if (isOverflowing)
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                _isExpanded ? 'أقل' : 'المزيد',
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Container(width: 4, height: 20, color: AppColors.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
