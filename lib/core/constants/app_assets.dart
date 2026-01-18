class AppAssets {
  AppAssets._();

  static final icons = _AppIcons();

  static final images = _AppImages();
}

class _AppImages {
  String get _path => "assets/images";

  String get onBoardingBacground => "$_path/Welcome.png";
  String get onBoardingGirl => "$_path/img_girl.png";
  String get dummyAlbumCard => "$_path/dummy_album_card.png";
  String get dummyTopMixesCard => "$_path/dummy_top_mixes_card.png";
  String get dummyTopGeneres => "$_path/dummy_top_generes.png";
}

class _AppIcons {
  String get _path => "assets/icons";

  String get addLg => "$_path/add-lg.svg";
  String get delete => "$_path/delete.svg";
  String get disc => "$_path/disc.svg";
  String get download => "$_path/download.svg";
  String get eyeOff => "$_path/eye-off.svg";
  String get hamburgerMenu => "$_path/hamburger-menu.svg";
  String get home3 => "$_path/home-3.svg";
  String get image1 => "$_path/shuffle.svg";
  String get instrumentPlaylist => "$_path/instrument-playlist.svg";
  String get leftMd => "$_path/left-md.svg";
  String get leftSm => "$_path/left-sm.svg";
  String get lock => "$_path/lock.svg";
  String get loop => "$_path/loop.svg";
  String get love => "$_path/love.svg";
  String get mail => "$_path/mail.svg";
  String get menu => "$_path/menu.svg";
  String get moon => "$_path/moon.svg";
  String get musicNote2 => "$_path/music-note-2.svg";
  String get notificationOn => "$_path/notification-on.svg";
  String get option => "$_path/option.svg";
  String get reloadUi => "$_path/reload-ui.svg";
  String get remove => "$_path/remove.svg";
  String get save => "$_path/save.svg";
  String get search => "$_path/search.svg";
  String get settingsUi => "$_path/settings-ui.svg";
  String get share => "$_path/share.svg";
  String get tag => "$_path/tag.svg";
  String get time => "$_path/time.svg";
  String get triangle => "$_path/triangle.svg";
  String get user => "$_path/user.svg";
  String get folderUi => "$_path/folder-ui.svg";
  String get searchLoupe => "$_path/search_loupe.svg";
}
