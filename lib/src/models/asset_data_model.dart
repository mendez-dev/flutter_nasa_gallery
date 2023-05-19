import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '../utils/serializer.dart';

part 'asset_data_model.g.dart';

abstract class AssetDataModel
    implements Built<AssetDataModel, AssetDataModelBuilder> {
  String? get center;
  @BuiltValueField(wireName: 'date_created')
  String get dateCreated;
  String? get description;
  BuiltList<String> get keywords;
  String? get location;
  @BuiltValueField(wireName: 'media_type')
  String get mediaType;
  @BuiltValueField(wireName: 'nasa_id')
  String get nasaId;
  String? get photographer;
  String get title;

  AssetDataModel._();
  factory AssetDataModel([void Function(AssetDataModelBuilder) updates]) =
      _$AssetDataModel;

  Map<String, dynamic> toJson() {
    return (serializers.serializeWith(AssetDataModel.serializer, this))
        as Map<String, dynamic>;
  }

  static AssetDataModel? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AssetDataModel.serializer, json);
  }

  static Serializer<AssetDataModel> get serializer =>
      _$assetDataModelSerializer;
}
