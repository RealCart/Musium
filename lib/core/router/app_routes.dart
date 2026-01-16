enum AppRoutes {
  onBoarding("/onBoarding"),
  home("/home"),
  explore('/explore'),
  library('/library');

  const AppRoutes(this.path);

  final String path;
}