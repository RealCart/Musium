import 'package:flutter/material.dart';
import 'package:musium/core/presentation/widgets/custom_bottom_navigation_bar/custom_bottom_bar_item.dart';
import 'package:musium/core/presentation/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';
import 'package:musium/core/theme/app_typography.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    required this.items,
    this.selectedIndex,
    this.onTap,
    super.key,
  });

  final List<CustomBottomBarItem> items;
  final ValueChanged<int>? onTap;
  final int? selectedIndex;

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late List<Widget> _children;

  @override
  void initState() {
    super.initState();
    _children = [
      for (int i = 0; i < widget.items.length; i++)       
        Expanded(
          child: CustomBottomNavigationBarItem(
            icon: widget.items[i].icon, 
            title: widget.items[i].title,
            onPressed: () => widget.onTap?.call(i),
            isSelected: i == widget.selectedIndex,
          )
        ),
    ];
  }

  @override
  void didUpdateWidget(covariant CustomBottomNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget != widget) {
      _children = [
        for (int i = 0; i < widget.items.length; i++)       
          Expanded(
            child: CustomBottomNavigationBarItem(
              icon: widget.items[i].icon, 
              title: widget.items[i].title,
              onPressed: () => widget.onTap?.call(i),
              isSelected: i == widget.selectedIndex,
            )
          ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .only(bottom: MediaQuery.of(context).viewPadding.bottom),
      child: SizedBox(
        height: kBottomNavigationBarHeight,
        child: DefaultTextStyle(
          style: AppTypography.centuryGothicBold11, 
          child: Flex(
            direction: .horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _children,
          ),
        ),
      ),
    );
  }
}