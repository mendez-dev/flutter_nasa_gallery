import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nasa_app/src/models/asset_data_model.dart';
import 'package:nasa_app/src/models/asset_link_model.dart';

import '../utils/serializer.dart';

part 'asset_model.g.dart';

abstract class AssetModel implements Built<AssetModel, AssetModelBuilder> {
  String get href;
  BuiltList<AssetDataModel> get data;
  BuiltList<AssetLinkModel> get links;

  AssetModel._();
  factory AssetModel([void Function(AssetModelBuilder) updates]) = _$AssetModel;

  Map<String, dynamic> toJson() {
    return (serializers.serializeWith(AssetModel.serializer, this))
        as Map<String, dynamic>;
  }

  static AssetModel? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AssetModel.serializer, json);
  }

  static Serializer<AssetModel> get serializer => _$assetModelSerializer;
}
