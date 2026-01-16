import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:musium/core/router/app_router.dart';
import 'package:musium/core/theme/app_theme.dart';
import 'package:musium/app_dependencies.dart';

void main() async {
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark, 
  ));

  AppDependencies.init();
  await AppDependencies.instance.allReady();

  runApp(const MyApp());

  FlutterNativeSplash.remove();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final RouterConfig<Object> _routerConfig;

  @override
  void initState() {
    super.initState();
    _routerConfig = AppDependencies.instance<AppRouter>().router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Musium',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.theme,
      routerConfig: _routerConfig,
    );
  }
}