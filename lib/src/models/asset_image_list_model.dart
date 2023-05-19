import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nasa_app/src/models/asset_image_model.dart';

import '../utils/serializer.dart';

part 'asset_image_list_model.g.dart';

abstract class AssetImageListModel
    implements Built<AssetImageListModel, AssetImageListModelBuilder> {
  String get version;
  String get href;
  BuiltList<AssetImageModel> get items;
  AssetImageListModel._();
  factory AssetImageListModel(
          [void Function(AssetImageListModelBuilder) updates]) =
      _$AssetImageListModel;

  Map<String, dynamic> toJson() {
    return (serializers.serializeWith(AssetImageListModel.serializer, this))
        as Map<String, dynamic>;
  }

  static AssetImageListModel? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AssetImageListModel.serializer, json);
  }

  static Serializer<AssetImageListModel> get serializer =>
      _$assetImageListModelSerializer;
}
