part of 'search_bloc.dart';

class SearchState extends Equatable {
  final bool isLoading;
  final bool isError;
  final bool showImages;
  final bool showVideos;
  final String query;
  final int initialYear;
  final int finalYear;
  final BuiltList<AssetModel> assets;

  const SearchState({
    required this.isLoading,
    required this.isError,
    required this.showImages,
    required this.showVideos,
    required this.query,
    required this.initialYear,
    required this.finalYear,
    required this.assets,
  });

  factory SearchState.initial() => SearchState(
        isLoading: false,
        isError: false,
        showImages: true,
        showVideos: true,
        query: '',
        initialYear: 1920,
        finalYear: DateTime.now().year,
        assets: BuiltList<AssetModel>(),
      );

  SearchState copyWith({
    bool? isLoading,
    bool? isError,
    bool? showImages,
    bool? showVideos,
    String? query,
    int? initialYear,
    int? finalYear,
    BuiltList<AssetModel>? assets,
  }) {
    return SearchState(
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      showImages: showImages ?? this.showImages,
      showVideos: showVideos ?? this.showVideos,
      query: query ?? this.query,
      initialYear: initialYear ?? this.initialYear,
      finalYear: finalYear ?? this.finalYear,
      assets: assets ?? this.assets,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        isError,
        showImages,
        showVideos,
        query,
        initialYear,
        finalYear,
        assets,
      ];
}
