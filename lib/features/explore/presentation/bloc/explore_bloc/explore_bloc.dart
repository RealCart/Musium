import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:musium/features/explore/domain/repository/explore_repository.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final ExploreRepository _exploreRepository;

  ExploreBloc({required ExploreRepository exploreRepository}) : 
  _exploreRepository = exploreRepository,
  super(const ExploreState()) {
    on<SuggestQueryEvent>(_onSuggestQuery);
  }

  void _onSuggestQuery(SuggestQueryEvent event, Emitter<ExploreState> emit) async {
    final response = await _exploreRepository.suggestQuery(event.query);

    response.fold(
      (l) {}, 
      (r) {},
    );
  }
}
