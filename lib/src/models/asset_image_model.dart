import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../utils/serializer.dart';

part 'asset_image_model.g.dart';

abstract class AssetImageModel implements Built<AssetImageModel, AssetImageModelBuilder> {
  

  String get href;

  AssetImageModel._();
  factory AssetImageModel([void Function(AssetImageModelBuilder) updates]) = _$AssetImageModel;

  Map<String, dynamic> toJson() {
    return (serializers.serializeWith(AssetImageModel.serializer, this))
        as Map<String, dynamic>;
  }

  static AssetImageModel? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AssetImageModel.serializer, json);
  }

  static Serializer<AssetImageModel> get serializer => _$assetImageModelSerializer;
}