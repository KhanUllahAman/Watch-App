// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class DropDownSelector extends StatelessWidget {
  final List<String> options;
  final String hint;
  final String selectedOption;
  final Function(String) onOptionChanged;
  const DropDownSelector(
      {Key? key,
      required this.options,
      required this.onOptionChanged,
      this.selectedOption = '',
      this.hint = 'select_an_option'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      hint: Text(
        hint,
        style: const TextStyle(color: Colors.grey),
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      borderRadius: BorderRadius.circular(10),
      style: const TextStyle(color: Colors.black),
      value: selectedOption == "" ? null : selectedOption,
      onChanged: (String? newValue) {
        if (newValue == null) {
          onOptionChanged('');
        } else {
          onOptionChanged(newValue);
        }
      },
      items: options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
