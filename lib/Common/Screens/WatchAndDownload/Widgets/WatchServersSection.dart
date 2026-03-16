import 'package:flutter/material.dart';
import '../../../../Models/WatchServer.dart';

class WatchServersSection extends StatefulWidget {
  final List<clsWatchServer> watchServers;

  const WatchServersSection({super.key, required this.watchServers});

  @override
  State<WatchServersSection> createState() => _WatchServersSectionState();
}

class _WatchServersSectionState extends State<WatchServersSection> {
  int? _selectedServerId;

  @override
  void initState() {
    super.initState();
    if (widget.watchServers.isNotEmpty) {
      _selectedServerId = widget.watchServers.first.ID;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'سيرفرات المشاهدة',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: widget.watchServers.length,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final server = widget.watchServers[index];
            final isSelected = server.ID == _selectedServerId;
            return GestureDetector(
              onTap: () => setState(() => _selectedServerId = server.ID),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFC62828) : const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      isSelected ? Icons.check_circle_outline : Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'سيرفر ${index + 1} ${index == 0 ? "(رئيسي)" : ""}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "سيرفر بديل • ${server.Quality}",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(
                      Icons.play_circle_filled,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}