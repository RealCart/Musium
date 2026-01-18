import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musium/core/theme/app_colors.dart';
import 'package:musium/core/theme/app_typography.dart';

class CustomBottomNavigationBarItem extends StatefulWidget {
  const CustomBottomNavigationBarItem({
    required this.icon,
    required this.title,
    required this.onPressed,
    required this.isSelected,
    super.key,
  });

  final String icon;
  final String title;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  State<CustomBottomNavigationBarItem> createState() =>
      _CustomBottomNavigationBarItemState();
}

class _CustomBottomNavigationBarItemState
    extends State<CustomBottomNavigationBarItem>
    with SingleTickerProviderStateMixin {
  bool _childHandledPress = false;
  late final AnimationController _animationController;
  late final Animation<double> _animationValue;

  Color _isSelectedColor(bool isSelected) {
    return isSelected ? AppColors.colorScheme3 : AppColors.white;
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _animationValue = Tween<double>(begin: 1.0, end: 0.85).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    if (widget.isSelected) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(covariant CustomBottomNavigationBarItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget != widget) {
      if (oldWidget.isSelected && !widget.isSelected) {
        if (!mounted) return;
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _handleTapDown(TapDownDetails detail) {
    const _PressScaleNotification().dispatch(context);

    Future.microtask(() {
      if (!_childHandledPress && mounted) {
        _animationController.forward();
      }

      _childHandledPress = false;
    });
  }

  Future<void> _handleTapUp(TapUpDetails details) async {
    await Future<void>.delayed(const Duration(milliseconds: 50));

    if (!mounted) return;
    widget.onPressed.call();
  }

  Future<void> _handleTapCancel() async {
    await Future<void>.delayed(const Duration(milliseconds: 50));

    if (!mounted) return;
    await _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<_PressScaleNotification>(
      onNotification: (notification) {
        _childHandledPress = true;
        return true;
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        child: Flex(
          direction: .vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animationValue,
              child: SvgPicture.asset(
                widget.icon,
                width: 20.0,
                height: 20.0,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  _isSelectedColor(widget.isSelected),
                  BlendMode.srcIn,
                ),
              ),
            ),
            Text(
              widget.title,
              style: AppTypography.centuryGothicBold11.setColor(
                _isSelectedColor.call(widget.isSelected),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PressScaleNotification extends Notification {
  const _PressScaleNotification();
}
