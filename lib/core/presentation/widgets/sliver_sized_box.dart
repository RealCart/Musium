import 'package:flutter/widgets.dart';

class SliverSizedBox extends StatelessWidget {
  const SliverSizedBox({
    this.height,
    this.width,
    this.child,
    super.key,
  });

  const SliverSizedBox.expand({
    this.child,
    super.key,
  }) : width = double.infinity,
       height = double.infinity;

  const SliverSizedBox.shrink({this.child, super.key})
    : width = 0.0,
      height = 0.0;

  const SliverSizedBox.square({
    required double dimension,
    this.child,
    super.key,
  }) : width = dimension,
       height = dimension;

  final double? width;
  final double? height;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
        width: width,
        child: child,
      ),
    );
  }
}
