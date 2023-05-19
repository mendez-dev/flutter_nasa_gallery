import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nasa_app/src/models/asset_image_list_model.dart';

import '../utils/serializer.dart';

part 'asset_image_list_response.g.dart';

abstract class AssetImageListResponse
    implements Built<AssetImageListResponse, AssetImageListResponseBuilder> {
  int get code;
  String get message;
  AssetImageListModel? get data;

  AssetImageListResponse._();
  factory AssetImageListResponse(
          [void Function(AssetImageListResponseBuilder) updates]) =
      _$AssetImageListResponse;

  Map<String, dynamic> toJson() {
    return (serializers.serializeWith(AssetImageListResponse.serializer, this))
        as Map<String, dynamic>;
  }

  static AssetImageListResponse? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AssetImageListResponse.serializer, json);
  }

  static Serializer<AssetImageListResponse> get serializer =>
      _$assetImageListResponseSerializer;
}
