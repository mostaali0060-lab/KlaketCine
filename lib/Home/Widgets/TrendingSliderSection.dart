import 'dart:async';
import 'package:flutter/material.dart';
import 'package:klaket_cine/Models/Series.dart';
import 'package:klaket_cine/Utils/Theme/AppColors.dart';
import 'package:klaket_cine/Common/Screens/ContentDetails/Screens/ContentDetailsScreen.dart';

class TrendingSliderSection extends StatefulWidget {
  final List<clsSeries> items;
  const TrendingSliderSection({super.key, required this.items});

  @override
  State<TrendingSliderSection> createState() => _TrendingSliderSectionState();
}

class _TrendingSliderSectionState extends State<TrendingSliderSection> {
  late final PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1.0, initialPage: 0);
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (widget.items.isEmpty) return;
      if (_currentPage < widget.items.length - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOutCubic,
        );
      } else {
        _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) return const SizedBox.shrink();

    return Stack(
      children: [
        SizedBox(
          height: 500,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              return _buildSliderItem(context, widget.items[index]);
            },
          ),
        ),
        // Bottom Center Indicator
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: _buildPageIndicator(),
        )
      ],
    );
  }

  Widget _buildSliderItem(BuildContext context, clsSeries item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ContentDetailsScreen(series: item),
          ),
        );
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildImage(item.Poster),
          // Gradient Overlay with App Background Color
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  AppColors.background.withAlpha(80),
                  AppColors.background.withAlpha(200),
                  AppColors.background,
                ],
                stops: const [0.2, 0.5, 0.8, 1.0], // Raised stops to start earlier
              ),
            ),
          ),
          // Content Overlay - Aligned to the LEFT as per the user's request
          Positioned(
            bottom: 50,
            right: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align to left
              children: [
                Text(
                  item.Title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'تشويق وإثارة • جريمة',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white.withAlpha(180), fontSize: 14),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start, // Align row items to the left
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.withAlpha(150),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'مكتمل',
                        style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text('2026', style: TextStyle(color: Colors.white)),
                    const SizedBox(width: 12),
                    Text(
                      '${item.Rating.toString().replaceAll('.', '٫')}',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String? path) {
    if (path == null || path.isEmpty) return Container(color: Colors.black);
    if (path.startsWith('assets/')) {
      final cleanPath = path.replaceFirst('assets/', '');
      return Image.asset(cleanPath, fit: BoxFit.cover);
    }
    return Image.network(path, fit: BoxFit.cover);
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.items.length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 3.0),
          height: 6.0,
          width: 6.0,
          decoration: BoxDecoration(
            color: _currentPage == index ? Colors.red : Colors.grey.withAlpha(150),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}