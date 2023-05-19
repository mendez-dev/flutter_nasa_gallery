import 'package:nasa_app/src/models/asset_image_list_response.dart';
import 'package:nasa_app/src/models/asset_metadata_response.dart';
import 'package:nasa_app/src/models/collection_response.dart';
import 'package:nasa_app/src/models/video_collection_response.dart';
import 'package:nasa_app/src/repositories/data_repository/data_repository.dart';
import 'package:nasa_app/src/repositories/network_repository/network_repository.dart';

class DataRepositoryImpl implements DataRepository {
  final NetworkRepository _network;

  DataRepositoryImpl({required NetworkRepository networkRepository})
      : _network = networkRepository;

  @override
  Future<CollectionResponse> getRecent() async {
    final response = await _network.instance.get(
      '/recent.json',
    );
    if (response.data['data']?['collection'] != null) {
      response.data['data'] = response.data['data']['collection'];
    }

    CollectionResponse collectionResponse =
        CollectionResponse.fromJson(response.data)!;

    return collectionResponse;
  }

  @override
  Future<AssetMetadataResponse> getAssetMetadata(
      {required String id, String type = 'image'}) async {
    final response = await _network.instance.get(
      '/$type/$id/metadata.json',
    );

    AssetMetadataResponse assetMetadataResponse =
        AssetMetadataResponse.fromJson(response.data)!;
    return assetMetadataResponse;
  }

  @override
  Future<AssetImageListResponse> getAssetImages({required String id}) async {
    final response = await _network.instance.get(
      '/asset/$id',
    );
    if (response.data['data']?['collection'] != null) {
      response.data['data'] = response.data['data']['collection'];
    }

    AssetImageListResponse assetImageListResponse =
        AssetImageListResponse.fromJson(response.data)!;
    return assetImageListResponse;
  }

  @override
  Future<CollectionResponse> getPopular() async {
    final response = await _network.instance.get(
      '/popular.json',
    );
    if (response.data['data']?['collection'] != null) {
      response.data['data'] = response.data['data']['collection'];
    }

    CollectionResponse collectionResponse =
        CollectionResponse.fromJson(response.data)!;

    return collectionResponse;
  }

  @override
  Future<VideoCollectionResponse> getVideos({required String id}) async {
    final response = await _network.instance.get('/video/$id/collection.json');
    VideoCollectionResponse videoCollectionResponse =
        VideoCollectionResponse.fromJson(response.data)!;
    return videoCollectionResponse;
  }
}
