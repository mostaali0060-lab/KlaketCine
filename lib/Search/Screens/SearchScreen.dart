import 'package:flutter/material.dart';
import 'package:klaket_cine/Utils/Theme/AppColors.dart';
import '../../Common/Screens/ContentDetails/Screens/ContentDetailsScreen.dart';
import '../../Common/Widgets/ContentCard.dart';
import '../../Data/SeriesDummyData.dart';
import '../../Models/Series.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<clsSeries> _allSeries = [];
  List<clsSeries> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _allSeries = SeriesDummyData.map((data) => clsSeries.fromMap(data)).toList();
    _searchResults = _allSeries;
  }

  void _onSearchChanged(String query) {
    setState(() {
      if (query.isEmpty) {
        _searchResults = _allSeries;
      } else {
        _searchResults = _allSeries
            .where((item) =>
                item.Title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'اكتشف',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'ابحث عن فيلم، مسلسل، ممثل...',
                hintStyle: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
                prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary),
                filled: true,
                fillColor: AppColors.surface,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.65,
          ),
          itemCount: _searchResults.length,
          itemBuilder: (context, index) {
            final item = _searchResults[index];
            return ContentCard(
              Series: item,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContentDetailsScreen(series: item),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}