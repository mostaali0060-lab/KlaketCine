import 'package:flutter/material.dart';
import 'package:klaket_cine/core/constants/app_colors.dart';

class SeasonDropdown extends StatefulWidget {
  final List<String> seasons;
  final Function(String) onChanged;

  const SeasonDropdown({
    super.key,
    required this.seasons,
    required this.onChanged,
  });

  @override
  State<SeasonDropdown> createState() => _SeasonDropdownState();
}

class _SeasonDropdownState extends State<SeasonDropdown> {
  late String _selectedSeason;

  @override
  void initState() {
    super.initState();
    _selectedSeason = widget.seasons.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.textSecondary.withOpacity(0.2)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedSeason,
          icon: const Icon(Icons.keyboard_arrow_down,
              color: AppColors.textPrimary),
          dropdownColor: AppColors.surface,
          style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.bold),
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                _selectedSeason = newValue;
              });
              widget.onChanged(newValue);
            }
          },
          items: widget.seasons.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
