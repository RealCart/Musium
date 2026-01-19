part of 'library_bloc.dart';

@immutable
sealed class LibraryEvent extends Equatable {
  const LibraryEvent();

  @override
  List<Object?> get props => [];
}

final class SelectTabEvent extends LibraryEvent {
  const SelectTabEvent({
    required this.selectedTab,
  });

  final TabEnum selectedTab;

  @override
  List<Object?> get props => [selectedTab];
}
