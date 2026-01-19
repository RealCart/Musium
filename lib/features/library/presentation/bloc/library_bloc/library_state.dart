part of 'library_bloc.dart';

@immutable
final class LibraryState extends Equatable {
  const LibraryState({
    this.selectedTab = TabEnum.playlists,
  });

  final TabEnum selectedTab;

  LibraryState copyWith({
    TabEnum? selectedTab,
  }) {
    return LibraryState(
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }

  @override
  List<Object?> get props => [
    selectedTab,
  ];
}
