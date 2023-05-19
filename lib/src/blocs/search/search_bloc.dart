import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:nasa_app/src/models/asset_model.dart';
import 'package:nasa_app/src/models/collection_response.dart';
import 'package:nasa_app/src/repositories/data_repository/data_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final DataRepository _dataRepository;

  SearchBloc({required DataRepository dataRepository})
      : _dataRepository = dataRepository,
        super(SearchState.initial()) {
    on<SearchInitialEvent>(_onSearchInitialEvent);
    on<ChangeDataRangeEvent>(_onChangeDataRangeEvent);
    on<ToogleImagesEvent>(_onToogleImagesEvent);
    on<ToogleVideosEvent>(_onToogleVideosEvent);
    on<ChangeQueryEvent>(_onChangeQueryEvent);
  }

  Future<void> _onSearchInitialEvent(
      SearchInitialEvent event, Emitter<SearchState> emit) async {
    emit(SearchState.initial());

    emit(state.copyWith(isLoading: true, isError: false));

    final CollectionResponse response = await _dataRepository.getRecent();
    emit(state.copyWith(isLoading: false));
    if (response.code == 200) {
      emit(state.copyWith(assets: response.data!.items));
    } else {
      emit(state.copyWith(isError: true));
    }
  }

  Future<void> _onChangeDataRangeEvent(
      ChangeDataRangeEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(
        initialYear: event.initialYear, finalYear: event.finalYear));

    if (event.search) {
      await _onSearchEvent(emit);
    }
  }

  Future<void> _onToogleImagesEvent(
      ToogleImagesEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(showImages: !state.showImages));
    await _onSearchEvent(emit);
  }

  Future<void> _onToogleVideosEvent(
      ToogleVideosEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(showVideos: !state.showVideos));
    await _onSearchEvent(emit);
  }

  Future<void> _onChangeQueryEvent(
      ChangeQueryEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(query: event.query));
    await _onSearchEvent(emit);
  }

  Future<void> _onSearchEvent(Emitter<SearchState> emit) async {
    emit(state.copyWith(isLoading: true, isError: false));

    final CollectionResponse response = await _dataRepository.search(
      query: state.query,
      initialYear: state.initialYear,
      finalYear: state.finalYear,
      showImages: state.showImages,
      showVideos: state.showVideos,
    );

    emit(state.copyWith(isLoading: false));
    if (response.code == 200) {
      emit(state.copyWith(assets: response.data!.items));

      if (response.data!.items.isEmpty) {
        emit(state.copyWith(isError: true));
      }


    } else {
      emit(state.copyWith(isError: true));
    }
  }
}
