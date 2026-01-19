import 'package:bloc/bloc.dart'; //ignore: depend_on_referenced_packages
import 'package:meta/meta.dart'; //ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';
import 'package:musium/features/library/domain/entity/tab_enum.dart';

part 'library_event.dart';
part 'library_state.dart';

final class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  LibraryBloc() : super(const LibraryState()) {
    on<SelectTabEvent>(_onSelectTab);
  }

  void _onSelectTab(SelectTabEvent event, Emitter<LibraryState> emit) {
    emit(
      state.copyWith(
        selectedTab: event.selectedTab,
      ),
    );
  }
}
