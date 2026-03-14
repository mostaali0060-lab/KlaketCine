import 'package:flutter/material.dart';
import 'package:klaket_cine/core/constants/app_colors.dart';

class CastCrewSection extends StatelessWidget {
  final String title;
  final List<Map<String, String>> members;

  const CastCrewSection({super.key, required this.title, required this.members});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double avatarRadius = screenWidth > 600 ? 32 : 28;

    // The width for the item itself, primarily for the avatar.
    final double itemWidth = (avatarRadius + 2) * 2;
    const double spacing = 16.0; // The desired space between each item.
    final double containerHeight = avatarRadius * 2 + 60; // Total height for the row.

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(title),
        const SizedBox(height: 16),
        SizedBox(
          height: containerHeight,
          // KEY FIX: Using ListView.separated for robust and consistent spacing.
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            // The parent widget (in the screen file) handles the initial padding.
            padding: EdgeInsets.zero,
            itemCount: members.length,
            itemBuilder: (context, index) {
              final member = members[index];
              // This is the widget for each actor.
              return SizedBox(
                width: itemWidth,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: avatarRadius + 2,
                      backgroundColor: AppColors.primary,
                      child: CircleAvatar(
                        radius: avatarRadius,
                        backgroundColor: AppColors.surface,
                        child: ClipOval(
                          child: Image.network(
                            member['image']!,
                            fit: BoxFit.cover,
                            width: avatarRadius * 2,
                            height: avatarRadius * 2,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.person,
                                color: AppColors.textSecondary,
                                size: avatarRadius,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      member['name']!,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      member['role']!,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
            // This builds the space between each actor.
            separatorBuilder: (context, index) => const SizedBox(width: spacing),
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
