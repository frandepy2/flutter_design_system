import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class DSCustomDropdown<T> extends StatelessWidget {
  final String label;
  final List<T> items;
  final T? selectedItem;
  final void Function(T?) onChanged;
  final String Function(T) itemLabel;

  const DSCustomDropdown({
    super.key,
    required this.label,
    required this.items,
    required this.onChanged,
    required this.itemLabel,
    this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.brightness == Brightness.dark ? AppColors.dark() : AppColors.light();

    return DropdownButtonFormField<T>(
      value: selectedItem,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: colors.secondaryLight.withOpacity(0.1),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      items: items.map((T item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(itemLabel(item)),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
