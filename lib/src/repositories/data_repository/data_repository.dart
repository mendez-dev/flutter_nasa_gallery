import 'package:nasa_app/src/models/asset_image_list_response.dart';
import 'package:nasa_app/src/models/asset_metadata_response.dart';
import 'package:nasa_app/src/models/video_collection_response.dart';

import '../../models/collection_response.dart';

abstract class DataRepository {
  Future<CollectionResponse> getRecent();
  Future<CollectionResponse> getPopular();
  Future<AssetMetadataResponse> getAssetMetadata(
      {required String id, String type = 'image'});
  Future<AssetImageListResponse> getAssetImages({required String id});
  Future<VideoCollectionResponse> getVideos({required String id});
}
