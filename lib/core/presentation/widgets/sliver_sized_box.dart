import 'package:flutter/widgets.dart';

class SliverSizedBox extends StatelessWidget {
  const SliverSizedBox({
    this.height,
    this.width,
    super.key,
  });

  const SliverSizedBox.expand({
    super.key,
  }) : width = double.infinity, height = double.infinity;

  const SliverSizedBox.shrink({
    super.key
  }) : width = 0.0, height = 0.0;

  const SliverSizedBox.square({
    required double dimension,
    super.key,
  }) : width = dimension, height = dimension;

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
        width: width,
      ),
    );
  }
}