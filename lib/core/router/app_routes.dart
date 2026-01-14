enum AppRoutes {
  onBoarding("/onBoarding"),
  home("/home");

  const AppRoutes(this.path);

  final String path;
}