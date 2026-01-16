import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musium/core/presentation/widgets/press_scale_transition.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.path,
    required this.onPressed,
  });

  final String path;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: PressScaleTransition(
        endScale: 0.85,
        onPressed: onPressed,
        child: SvgPicture.asset(path), 
      ),
    );
  }
}