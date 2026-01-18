import 'package:flutter/material.dart';
import 'package:musium/core/constants/app_assets.dart';
import 'package:musium/core/presentation/widgets/gradient_scaffold.dart';
import 'package:musium/core/presentation/widgets/screen_section.dart';
import 'package:musium/core/presentation/widgets/sliver_sized_box.dart';
import 'package:musium/core/theme/app_colors.dart';
import 'package:musium/core/theme/app_typography.dart';
import 'package:musium/features/explore/presentation/widgets/sliver_text_field_pinned_header.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

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
              ),
            ),
            const SliverSizedBox(height: 29.0),
            const SliverTextFieldPinnedHeader(),
            SliverPadding(
              padding: const .symmetric(horizontal: 39.0),
              sliver: SliverList.list(
                children: [
                  const SizedBox(height: 32.0),
                  ScreenSection(
                    title: "Your Top Genres",
                    child: GridView.builder(
                      primary: false,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(7.0),
                          child: ColoredBox(
                            color: const Color(0xffCF25A0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsGeometry.only(
                                    top: 14.0,
                                    left: 14.0,
                                  ),
                                  child: Text(
                                    "Indie",
                                    style: AppTypography.centuryGothicBold16
                                        .setColor(
                                          AppColors.white,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Transform.rotate(
                                    angle: 0.471,
                                    child: Image.asset(
                                      AppAssets.images.dummyTopGeneres,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 13.0,
                        crossAxisSpacing: 21.0,
                        mainAxisExtent: screenHeight * 0.106,
                        childAspectRatio: 1.704,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
