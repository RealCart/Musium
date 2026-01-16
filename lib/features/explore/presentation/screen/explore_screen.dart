import 'package:flutter/material.dart';
import 'package:musium/core/presentation/widgets/gradient_scaffold.dart';
import 'package:musium/core/presentation/widgets/sliver_sized_box.dart';
import 'package:musium/core/theme/app_colors.dart';
import 'package:musium/core/theme/app_typography.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverPadding(
              padding: .symmetric(horizontal: 39.0),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "Search", 
                  style: AppTypography.centuryGothicBold27,
                ),
              )
            ),
            const SliverSizedBox(height: 29.0),
            const SliverAppBar(
              centerTitle: true,
              pinned: true,
              snap: true,
              floating: true,
              surfaceTintColor: AppColors.transparent,
              title: TextField(
                decoration: InputDecoration(
                  fillColor: AppColors.circleColor,
                  filled: true,
                ),
              ),
            ),
            SliverPadding(
              padding: const .symmetric(horizontal: 39.0),
              sliver: SliverList.list(
                children: [],
              ),
            )
            
          ],
        ),
      )
    );
  }
}