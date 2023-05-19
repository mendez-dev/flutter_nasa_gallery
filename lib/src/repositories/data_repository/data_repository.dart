import 'dart:io';

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
  Future<void> donloadRandomImages();
  Future<List<File>> getDownloadedImages();
  Future<CollectionResponse> search(
      {required String query,
      required int initialYear,
      required int finalYear,
      required bool showImages,
      required bool showVideos});
}
