import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musium/app_dependencies.dart';
import 'package:musium/core/constants/app_assets.dart';
import 'package:musium/core/presentation/widgets/custom_icon_button.dart';
import 'package:musium/core/presentation/widgets/gradient_scaffold.dart';
import 'package:musium/core/presentation/widgets/sliver_sized_box.dart';
import 'package:musium/core/theme/app_typography.dart';
import 'package:musium/core/utils/extenstons/go_route_extension.dart';
import 'package:musium/features/library/domain/entity/tab_enum.dart';
import 'package:musium/features/library/presentation/bloc/library_bloc/library_bloc.dart';
import 'package:musium/features/library/presentation/widgets/custom_text_button.dart';
import 'package:musium/features/library/presentation/widgets/rounded_gradient_button.dart';

class LibraryScreen extends StatelessWidget implements GoRouteWrapper {
  const LibraryScreen({super.key});

  @override
  Widget wrppedRoute(BuildContext context) {
    return BlocProvider<LibraryBloc>(
      create: (_) => AppDependencies.instance<LibraryBloc>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return GradientScaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const .symmetric(horizontal: 39.0),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Your Library",
                      style: AppTypography.centuryGothicBold27,
                    ),
                    CustomIconButton(
                      path: AppAssets.icons.search,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            const SliverSizedBox(height: 24.0),
            SliverSizedBox(
              height: screenHeight * 0.035,
              child: BlocSelector<LibraryBloc, LibraryState, TabEnum>(
                selector: (state) => state.selectedTab,
                builder: (context, state) {
                  log("$state", name: "Rebuild");
                  return ListView.separated(
                    padding: const .symmetric(horizontal: 39.0),
                    scrollDirection: Axis.horizontal,
                    cacheExtent: 200.0,
                    itemBuilder: (context, index) {
                      final item = TabEnum.values[index];
                      final isSelected = state.index == index;

                      return CustomTextButton(
                        title: item.title,
                        isSelected: isSelected,
                        onPressed: () {
                          BlocProvider.of<LibraryBloc>(
                            context,
                          ).add(
                            SelectTabEvent(selectedTab: item),
                          );
                        },
                      );
                    },
                    itemCount: TabEnum.values.length,
                    separatorBuilder: (_, _) => const SizedBox(
                      width: 11.0,
                    ),
                  );
                },
              ),
            ),
            const SliverSizedBox(height: 20.0),
            SliverPadding(
              padding: const .symmetric(horizontal: 39.0),
              sliver: BlocSelector<LibraryBloc, LibraryState, TabEnum>(
                selector: (state) => state.selectedTab,
                builder: (context, state) {
                  final title = state.title.toLowerCase();

                  return SliverList.list(
                    children: [
                      if (state == TabEnum.playlists) ...[
                        RoundedGradientButton(
                          path: AppAssets.icons.addLg,
                          title: "Add New Playlist",
                          onPressed: () {},
                        ),
                        const SizedBox(height: 25.5),
                      ],
                      RoundedGradientButton(
                        path: AppAssets.icons.love,
                        title: "Your Liked $title",
                        onPressed: () {},
                      ),
                    ],
                  );
                },
              ),
            ),
            const SliverSizedBox(height: 34.5),
            const SliverSizedBox(height: 27.0),
          ],
        ),
      ),
    );
  }
}
