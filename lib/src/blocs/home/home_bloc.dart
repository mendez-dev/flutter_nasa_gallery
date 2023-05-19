import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<HomeEvent>((event, emit) {});
    on<NavigateToEvent>((event, emit) {
      emit(state.copyWith(index: event.index));
    });
  }
}
