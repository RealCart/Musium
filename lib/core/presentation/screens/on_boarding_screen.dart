import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:musium/core/constants/app_assets.dart';
import 'package:musium/core/presentation/widgets/glowing_button.dart';
import 'package:musium/core/router/app_routes.dart';
import 'package:musium/core/theme/app_colors.dart';
import 'package:musium/core/theme/app_typography.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final GlobalKey _bottomKey;
  double _bottomHeight = 0;

  @override
  void initState() {
    super.initState();
    _bottomKey = GlobalKey();
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureBottom());
  }
  
  void _measureBottom() {
    final ctx = _bottomKey.currentContext;
    if (ctx == null) return;

    final box = ctx.findRenderObject() as RenderBox;
    final h = box.size.height;

    if (h != _bottomHeight) {
      setState(() => _bottomHeight = h - 10.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: AppTypography.centuryGothicBold24,
        textAlign: TextAlign.center,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AppAssets.images.onBoardingBacground),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: _bottomHeight,
                left: 20.0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    AppAssets.images.onBoardingGirl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  key: _bottomKey,
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(31.5, 58.0, 31.5, 64.0),
                  decoration: const BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(54.0),
                      topRight: Radius.circular(54.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: "From the "),
                            TextSpan(
                              text: "latest ",
                              style: TextStyle(color: AppColors.text5),
                            ),
                            TextSpan(text: "to the "),
                            TextSpan(
                              text: "greatest ",
                              style: TextStyle(color: AppColors.text5),
                            ),
                            TextSpan(text: "hits, play your favorite tracks on "),
                            TextSpan(
                              text: "musium ",
                              style: TextStyle(
                                color: AppColors.text3,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            TextSpan(text: "now!"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      GlowingButton(
                        text: "Get Started",
                        onPressed: () => context.goNamed(AppRoutes.home.name)
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
