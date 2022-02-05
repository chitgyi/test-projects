import 'package:flutter/material.dart';

class SwitchBar extends StatefulWidget {
  const SwitchBar({
    required this.items,
    this.selectedIndex = 0,
    this.onSelected,
    Key? key,
  }) : super(key: key);
  final Function(String)? onSelected;
  final int selectedIndex;
  final List<String> items;

  @override
  State<SwitchBar> createState() => _SwitchBarState();
}

class _SwitchBarState extends State<SwitchBar> {
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(50 / 2),
      ),
      child: Row(
        children: widget.items
            .asMap()
            .entries
            .map((item) => Expanded(
                  child: _SwitchItem(
                    text: item.value,
                    isSelected: item.key == selectedIndex,
                    onTap: () {
                      setState(() {
                        selectedIndex = item.key;
                      });
                      widget.onSelected?.call(item.value);
                    },
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class _SwitchItem extends StatelessWidget {
  const _SwitchItem({
    required this.text,
    this.isSelected = false,
    this.onTap,
    Key? key,
  }) : super(key: key);
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : null,
          borderRadius: BorderRadius.circular(50 / 2),
          border: Border.all(
            color: isSelected ? Colors.lightBlue : Colors.transparent,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
