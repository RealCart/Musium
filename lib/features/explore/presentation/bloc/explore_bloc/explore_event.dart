part of 'explore_bloc.dart';

sealed class ExploreEvent extends Equatable {
  const ExploreEvent();

  @override
  List<Object> get props => [];
}

final class SuggestQueryEvent extends ExploreEvent {
  const SuggestQueryEvent(this.query);

  final String query;

  @override
  List<Object> get props => [query];
}