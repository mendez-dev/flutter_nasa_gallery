part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class NavigateToEvent extends HomeEvent {
  final int index;

  const NavigateToEvent({required this.index});

  @override
  List<Object> get props => [index];
}
