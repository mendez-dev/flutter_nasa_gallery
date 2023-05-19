import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:nasa_app/src/models/asset_metadata_response.dart';
import 'package:nasa_app/src/models/response_model.dart';

import '../models/asset_data_model.dart';
import '../models/asset_image_list_model.dart';
import '../models/asset_image_list_response.dart';
import '../models/asset_image_model.dart';
import '../models/asset_link_model.dart';
import '../models/asset_metadata_model.dart';
import '../models/asset_model.dart';
import '../models/collection_model.dart';
import '../models/collection_response.dart';
import '../models/video_collection_response.dart';

part 'serializer.g.dart';

@SerializersFor([
  ResponseModel,
  AssetModel,
  AssetDataModel,
  AssetLinkModel,
  CollectionModel,
  CollectionResponse,
  AssetMetadataModel,
  AssetMetadataResponse,
  AssetImageModel,
  AssetImageListModel,
  AssetImageListResponse,
  VideoCollectionResponse
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
