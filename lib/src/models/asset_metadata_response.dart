import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../utils/serializer.dart';
import 'asset_metadata_model.dart';

part 'asset_metadata_response.g.dart';

abstract class AssetMetadataResponse implements Built<AssetMetadataResponse, AssetMetadataResponseBuilder> {
  int get code;
  String get message;
  AssetMetadataModel? get data;

  AssetMetadataResponse._();
  factory AssetMetadataResponse([void Function(AssetMetadataResponseBuilder) updates]) = _$AssetMetadataResponse;

  Map<String, dynamic> toJson() {
    return (serializers.serializeWith(AssetMetadataResponse.serializer, this))
        as Map<String, dynamic>;
  }

  static AssetMetadataResponse? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AssetMetadataResponse.serializer, json);
  }

  static Serializer<AssetMetadataResponse> get serializer => _$assetMetadataResponseSerializer;
}