import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musium/core/constants/app_assets.dart';
import 'package:musium/core/theme/app_colors.dart';
import 'package:musium/core/theme/app_typography.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    this.controller,
    this.focusNode,
    this.hintText,
    super.key,
  });

  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTypography.centuryGothicRegular13Grey,
      controller: controller,
      focusNode: focusNode,
      onTap: () => showSearch(context: context, delegate: _CustomSearchDelegate()),
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        prefixIcon: SvgPicture.asset(
          AppAssets.icons.searchLoupe,
          fit: .scaleDown,
        ),
        contentPadding: const EdgeInsets.fromLTRB(
          7.0,
          10.0,
          10.0,
          10.0,
        ),
        fillColor: AppColors.circleColor,
        filled: true,
        hintText: hintText,
        hintStyle: AppTypography.centuryGothicRegular13Grey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );
  }
}

class _CustomSearchDelegate extends SearchDelegate {

  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  bool? get automaticallyImplyLeading => true;

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.separated(
      itemBuilder:(context, index) => const Text("Hii"), 
      separatorBuilder:(_, _) => const SizedBox(height: 5.0,), 
      itemCount: 10,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Text("Hiii");
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 10.0);
      },
    );
  }

  @override
  void showResults(BuildContext context) {
    if (query.isEmpty) {
      return;
    }

    super.showResults(context);
  }
}