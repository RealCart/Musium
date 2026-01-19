import 'package:flutter/material.dart';
import 'package:musium/core/constants/app_assets.dart';
import 'package:musium/core/constants/app_constants.dart';
import 'package:musium/core/presentation/widgets/gradient_scaffold.dart';
import 'package:musium/core/presentation/widgets/screen_section.dart';
import 'package:musium/core/presentation/widgets/sliver_sized_box.dart';
import 'package:musium/core/theme/app_typography.dart';
import 'package:musium/features/explore/presentation/widgets/search_text_field.dart';
import 'package:musium/features/explore/presentation/widgets/explore_card.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final cardExtent = screenHeight * 0.106;

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
            const SliverPadding(
              padding: .symmetric(horizontal: 28.0),
              sliver: SliverToBoxAdapter(
                child: SearchTextField(
                  hintText: "Songs, Artists, Podcasts & More",
                ),
              ),
            ),
            SliverPadding(
              padding: const .fromLTRB(
                39.0,
                0.0,
                39.0,
                kBottomNavigationBarHeight + 30.0,
              ),
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
                      cacheExtent: 2 * cardExtent,
                      itemBuilder: (context, index) {
                        final Color backgroundColor =
                            AppConstants.topGenresColors[index];

                        return ExploreCard(
                          title: "Indie",
                          imagePath: AppAssets.images.dummyTopGeneres,
                          backgroundColor: backgroundColor,
                          onPressed: () {},
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 13.0,
                        crossAxisSpacing: 21.0,
                        mainAxisExtent: cardExtent,
                        childAspectRatio: 1.704,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  ScreenSection(
                    title: "Browse All",
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      primary: false,
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 13.0,
                        crossAxisSpacing: 21.0,
                        mainAxisExtent: cardExtent,
                        childAspectRatio: 1.704,
                      ),
                      itemBuilder: (context, index) {
                        return ExploreCard(
                          title: "Indie",
                          imagePath: AppAssets.images.dummyTopGeneres,
                          backgroundColor: AppConstants.topGenresColors[2],
                          onPressed: () {},
                        );
                      },
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
