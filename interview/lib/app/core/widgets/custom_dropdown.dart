import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    required this.items,
    this.selectedIndex,
    this.hintText,
    this.onSelected,
    this.validator,
    Key? key,
  }) : super(key: key);
  final List<String> items;
  final int? selectedIndex;
  final Function(int)? onSelected;
  final String? hintText;
  final String? Function(int?)? validator;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  int? selectedIndex;

  @override
  void initState() {
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      value: selectedIndex,
      validator: widget.validator,
      hint: Text(widget.hintText ?? 'Select a value'),
      isExpanded: true,
      items: widget.items.asMap().entries.map((item) {
        return DropdownMenuItem<int>(
          value: item.key,
          child: Text(item.value),
        );
      }).toList(),
      onChanged: (index) {
        if (index != null) {
          setState(() {
            selectedIndex = index;
          });
          widget.onSelected?.call(index);
        }
      },
    );
  }
}
