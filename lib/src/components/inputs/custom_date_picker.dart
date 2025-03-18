import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DSCustomDatePicker extends StatefulWidget {
  final String label;
  final void Function(DateTime) onDateSelected;

  const DSCustomDatePicker({
    super.key,
    required this.label,
    required this.onDateSelected,
  });

  @override
  _DSCustomDatePickerState createState() => _DSCustomDatePickerState();
}

class _DSCustomDatePickerState extends State<DSCustomDatePicker> {
  DateTime? _selectedDate;

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() => _selectedDate = pickedDate);
      widget.onDateSelected(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.label),
      subtitle: Text(
        _selectedDate != null ? DateFormat.yMMMd().format(_selectedDate!) : "Select a date",
      ),
      trailing: Icon(Icons.calendar_today),
      onTap: _pickDate,
    );
  }
}
