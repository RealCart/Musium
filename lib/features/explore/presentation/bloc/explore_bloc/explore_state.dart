part of 'explore_bloc.dart';

@immutable
final class ExploreState extends Equatable {
  const ExploreState({
    this.suggestions = const [],
  });

  final List<String> suggestions;

  ExploreState copyWith({
    List<String>? suggestions,
  }) {
    return ExploreState(
      suggestions: suggestions ?? this.suggestions,
    );
  }
  
  @override
  List<Object> get props => [suggestions,];
}

