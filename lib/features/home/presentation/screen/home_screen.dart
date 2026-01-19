import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musium/core/constants/app_assets.dart';
import 'package:musium/core/presentation/widgets/custom_icon_button.dart';
import 'package:musium/core/presentation/widgets/gradient_scaffold.dart';
import 'package:musium/core/presentation/widgets/profile_circle_avatar.dart';
import 'package:musium/core/presentation/widgets/screen_section.dart';
import 'package:musium/core/theme/app_colors.dart';
import 'package:musium/core/theme/app_typography.dart';
import 'package:musium/core/utils/extenstons/go_route_extension.dart';
import 'package:musium/features/home/presentation/widget/album_card.dart';
import 'package:musium/features/home/presentation/widget/mixes_card.dart';
import 'package:musium/features/home/presentation/widget/recommendation_card.dart';

class HomeScreen extends StatelessWidget implements GoRouteWrapper {
  const HomeScreen({super.key});

  @override
  Widget wrppedRoute(BuildContext context) {
    return this;
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double recommendationDimension = screenHeight * 0.192;
    log("Rebuild...", name: "HomeScreen");

    return GradientScaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.transparent,
              leading: Padding(
                padding: const .symmetric(horizontal: 23.0),
                child: Row(
                  children: [
                    ProfileCircleAvatar(
                      child: SvgPicture.asset(
                        AppAssets.icons.user,
                        colorFilter: const ColorFilter.mode(
                          AppColors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .start,
                        mainAxisAlignment: .center,
                        children: [
                          Text(
                            "Welcome back !",
                            style: AppTypography.centuryGothicBold16.setColor(
                              AppColors.white,
                            ),
                          ),
                          const Text(
                            "chandrama",
                            style: AppTypography.centuryGothicBold13,
                          ),
                        ],
                      ),
                    ),
                    CustomIconButton(
                      onPressed: () {},
                      path: AppAssets.icons.settingsUi,
                    ),
                  ],
                ),
              ),
              leadingWidth: double.infinity,
            ),
            SliverPadding(
              padding: const .fromLTRB(
                29.0,
                30.0,
                16.0,
                kBottomNavigationBarHeight + 30.0,
              ),
              sliver: SliverList.list(
                children: [
                  ScreenSection(
                    title: "Continue Listening",
                    child: GridView.builder(
                      itemCount: 6,
                      shrinkWrap: true,
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 9.0,
                        crossAxisSpacing: 12.0,
                        mainAxisExtent: screenHeight * 0.07,
                      ),
                      itemBuilder: (context, index) {
                        return AlbumCard(
                          onPressed: () {},
                          imagePath: AppAssets.images.dummyAlbumCard,
                          name: "Coffe & Jazz",
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 35.0),
                  ScreenSection(
                    title: "Your Top Mixes",
                    child: SizedBox(
                      height: screenHeight * 0.162,
                      child: RepaintBoundary(
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          cacheExtent: 200.0,
                          itemBuilder: (context, index) {
                            return MixesCard(
                              dimension: screenHeight * 0.162,
                              imagePath: AppAssets.images.dummyTopMixesCard,
                              title: "Pop Mix",
                              onPressed: () {},
                            );
                          },
                          separatorBuilder: (_, _) =>
                              const SizedBox(width: 31.0),
                          itemCount: 4,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 45.0),
                  ScreenSection(
                    title: "Recommendations",
                    child: SizedBox(
                      height: recommendationDimension,
                      child: RepaintBoundary(
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          cacheExtent: 3 * recommendationDimension,
                          itemBuilder: (context, index) {
                            return RecommendationCard(
                              onPressed: () {},
                              imagePath: AppAssets.images.dummyTopMixesCard,
                            );
                          },
                          separatorBuilder: (_, _) =>
                              const SizedBox(width: 38.0),
                          itemCount: 4,
                        ),
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
