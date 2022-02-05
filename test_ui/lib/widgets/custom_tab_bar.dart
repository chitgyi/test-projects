import 'package:flutter/material.dart';
import 'package:test_ui/utils/constants/custom_colors.dart';
import 'package:test_ui/utils/custom_shape.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar(
    this.items, {
    Key? key,
    this.onTap,
    this.selectedIndex = 0,
  }) : super(key: key);
  final int selectedIndex;
  final List<String> items;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: GestureDetector(
            onTap: () => onTap?.call(0),
            child: CustomPaint(
              painter: CustomShape(
                  bothSide: true,
                  fillColor: selectedIndex == 0 ? CustomColors.accent : null),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  items.first,
                  style: const TextStyle(
                    color: CustomColors.secondary,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: GestureDetector(
              onTap: () => onTap?.call(1),
              child: CustomPaint(
                painter: CustomShape(
                    fillColor: selectedIndex == 1 ? CustomColors.accent : null),
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    items.last,
                    style: const TextStyle(
                      color: CustomColors.secondary,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        selectedIndex == 0
            ? SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: GestureDetector(
                  onTap: () => onTap?.call(0),
                  child: CustomPaint(
                    painter: CustomShape(
                        bothSide: true,
                        fillColor:
                            selectedIndex == 0 ? CustomColors.accent : null),
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        items.first,
                        style: const TextStyle(
                          color: CustomColors.secondary,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink()
      ]),
    );
  }
}
