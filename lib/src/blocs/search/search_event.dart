part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class ChangeDataRangeEvent extends SearchEvent {
  final int initialYear;
  final int finalYear;
  final bool search;

  const ChangeDataRangeEvent({
    required this.initialYear,
    required this.finalYear,
    this.search = false,
  });

  @override
  List<Object> get props => [initialYear, finalYear];
}

class ToogleImagesEvent extends SearchEvent {
  const ToogleImagesEvent();
}

class ToogleVideosEvent extends SearchEvent {
  const ToogleVideosEvent();
}

class ChangeQueryEvent extends SearchEvent {
  final String query;

  const ChangeQueryEvent({required this.query});

  @override
  List<Object> get props => [query];
}

class SearchInitialEvent extends SearchEvent {
  const SearchInitialEvent();
}
