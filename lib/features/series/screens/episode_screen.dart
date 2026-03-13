
import 'package:flutter/material.dart';
import 'package:klaket_cine/core/constants/app_colors.dart';

class EpisodeScreen extends StatelessWidget {
  final Map<String, dynamic> episode;

  const EpisodeScreen({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            backgroundColor: AppColors.background,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
              onPressed: () => Navigator.of(context).pop(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: _buildVideoPlayer(context),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  _buildTitleSection(),
                  const SizedBox(height: 24),
                  _buildActionButtons(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          episode['seriesTitle'] ?? 'اسم المسلسل',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'الموسم ${episode['season']} - الحلقة ${episode['episode']}',
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildVideoPlayer(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(episode['image'], fit: BoxFit.cover),
        Container(decoration: BoxDecoration(color: Colors.black.withOpacity(0.5))),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            const Icon(Icons.play_arrow_rounded, color: Colors.white70, size: 80.0),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.pause, color: Colors.white, size: 30),
                  const SizedBox(width: 12),
                  const Icon(Icons.replay_10, color: Colors.white, size: 30),
                  const SizedBox(width: 12),
                  const Icon(Icons.forward_10, color: Colors.white, size: 30),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: SizedBox(
                      height: 5.0,
                      child: LinearProgressIndicator(
                        value: 0.3,
                        backgroundColor: Colors.white30,
                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('15:30 / 45:00', style: TextStyle(color: Colors.white, fontSize: 12)),
                  const SizedBox(width: 12),
                  const Icon(Icons.settings, color: Colors.white, size: 24),
                  const SizedBox(width: 12),
                  const Icon(Icons.fullscreen, color: Colors.white, size: 30),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final watchQualities = ['1080p', '720p', '480p', '360p'];
    final downloadServers = [
      {'quality': '1080p', 'size': '1.2 GB'},
      {'quality': '720p', 'size': '850 MB'},
      {'quality': '480p', 'size': '500 MB'},
    ];

    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.play_circle_outline_rounded),
            label: const Text('مشاهدة الآن'),
            onPressed: () => _showServersBottomSheet(context, 'سيرفرات المشاهدة', watchQualities.map((q) => {'quality': q}).toList(), false),
            style: _actionButtonStyle(),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.download_for_offline_outlined),
            label: const Text('تحميل'),
            onPressed: () => _showServersBottomSheet(context, 'سيرفرات التحميل', downloadServers, true),
            style: _actionButtonStyle(isPrimary: false),
          ),
        ),
      ],
    );
  }

  ButtonStyle _actionButtonStyle({bool isPrimary = true}) {
    return ElevatedButton.styleFrom(
      backgroundColor: isPrimary ? AppColors.primary : AppColors.surface,
      foregroundColor: isPrimary ? Colors.white : AppColors.textPrimary,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'Cairo', // Set the font to Cairo
      ),
    );
  }

  void _showServersBottomSheet(BuildContext context, String title, List<Map<String, String>> servers, bool isDownload) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1C21), // Dark surface color
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 4, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white, size: 28),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: servers.length,
                itemBuilder: (context, index) {
                  final server = servers[index];
                  final quality = server['quality']!;
                  final size = server['size'];

                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF282A30), // Item background
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          if (isDownload && size != null)
                            Text(
                              size,
                              style: const TextStyle(color: AppColors.textSecondary, fontSize: 15),
                            ),
                          const Spacer(),
                          Text(
                            quality,
                            style: const TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
