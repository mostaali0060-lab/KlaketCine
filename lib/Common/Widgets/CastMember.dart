import 'package:flutter/material.dart';
import '../../Models/CastMember.dart';

class CastMemberWidget extends StatelessWidget {
  final clsCastMember member;

  const CastMemberWidget({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blueAccent.withOpacity(0.5), width: 2),
            ),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[900],
              backgroundImage: member.ImageUrl != null && member.ImageUrl!.isNotEmpty
                  ? NetworkImage(member.ImageUrl!)
                  : null,
              child: member.ImageUrl == null || member.ImageUrl!.isEmpty
                  ? const Icon(Icons.person, size: 40, color: Colors.grey)
                  : null,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            member.Name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (member.Role != null)
            Text(
              member.Role!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 12,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
    );
  }
}