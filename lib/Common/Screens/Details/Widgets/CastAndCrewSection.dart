import 'package:flutter/material.dart';
import '../../../../Models/Series.dart';
import '../../../../Models/CastMember.dart';
import '../../../Widgets/CastMember.dart';
import '../../../Widgets/SectionHeader.dart';

class CastAndCrewSection extends StatelessWidget {
  final clsSeries series;

  const CastAndCrewSection({super.key, required this.series});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (series.Cast.isNotEmpty)
          _buildPersonList('الممثلين', series.Cast),
        if (series.Crew.isNotEmpty)
          _buildPersonList('فريق العمل', series.Crew),
      ],
    );
  }

  Widget _buildPersonList(String title, List<clsCastMember> people) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: title),
        const SizedBox(height: 16),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: people.length,
            itemBuilder: (context, index) {
              final person = people[index];
              return Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: CastMemberWidget(member: person),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}