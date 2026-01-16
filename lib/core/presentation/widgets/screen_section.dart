import 'package:flutter/material.dart';
import 'package:musium/core/presentation/widgets/section_title.dart';

class ScreenSection extends StatelessWidget {
  const ScreenSection({
    required this.title,
    required this.child,
    super.key,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsGeometry.only(left: 2.0),
          child: SectionTitle(title: title,),
        ),
        const SizedBox(height: 12.0),
        child,
      ],
    );
  }
}