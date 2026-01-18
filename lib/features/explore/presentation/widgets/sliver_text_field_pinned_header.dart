import 'package:flutter/material.dart';
import 'package:musium/features/explore/presentation/widgets/search_text_field.dart';

class SliverTextFieldPinnedHeader extends StatelessWidget {
  const SliverTextFieldPinnedHeader({
    this.margin = const .symmetric(horizontal: 28.0),
    super.key,
  });

  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverPinnedHeaderDelegate(
        margin: margin,
      ),
    );
  }
}

class _SliverPinnedHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _SliverPinnedHeaderDelegate({
    required this.margin,
  });

  final EdgeInsets margin;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double pinnedPercentage = shrinkOffset / maxExtent;
    final double reversedPinnedPercentage = 1 - pinnedPercentage;
    final bool isPinned = pinnedPercentage > 0.0;

    return Padding(
      padding: margin.copyWith(
        left: reversedPinnedPercentage * margin.left,
        right: reversedPinnedPercentage * margin.right,
      ),
      child: SearchTextField(
        isPinned: isPinned,
      ),
    );
  }

  @override
  double get maxExtent => 44.0;

  @override
  double get minExtent => 44.0;

  @override
  bool shouldRebuild(covariant _SliverPinnedHeaderDelegate oldDelegate) {
    return oldDelegate.margin != margin;
  }
}
