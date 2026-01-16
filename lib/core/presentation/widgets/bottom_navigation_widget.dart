import 'package:flutter/material.dart';
import 'package:musium/core/constants/app_assets.dart';
import 'package:musium/core/presentation/widgets/custom_bottom_navigation_bar/custom_bottom_bar_item.dart';
import 'package:musium/core/presentation/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:musium/core/theme/app_colors.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({
    required this.selectedTab,
    required this.currentIndex,
    required this.onPressed,
    super.key,
  });

  final Widget selectedTab;
  final int currentIndex;
  final ValueChanged<int> onPressed;

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          child: widget.selectedTab,
        ),
        Positioned(
          left: 0.0,
          right: 0.0,
          top: MediaQuery.of(context).size.height * 0.775,
          bottom: 0.0,
          child: const IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.0,
                    0.78,
                  ],
                  colors: [
                    AppColors.transparent,
                    Colors.black,
                  ]
                )
              ),
            ),
          )
        ),
        Positioned(
          bottom: 0,
          left: 0.0,
          right: 0.0,
          child: CustomBottomNavigationBar(
            selectedIndex: widget.currentIndex,
            onTap: widget.onPressed,
            items: [
              CustomBottomBarItem(icon: AppAssets.icons.home3, title: "Home"),
              CustomBottomBarItem(icon: AppAssets.icons.search, title: "Explore"),
              CustomBottomBarItem(icon: AppAssets.icons.folderUi, title: "Library"),
            ]
          )
        )
      ],
    );
  }
}