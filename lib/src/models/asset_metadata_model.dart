import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../utils/serializer.dart';

part 'asset_metadata_model.g.dart';

abstract class AssetMetadataModel
    implements Built<AssetMetadataModel, AssetMetadataModelBuilder> {
  @BuiltValueField(wireName: 'AVAIL:Center')
  String? get center;
  @BuiltValueField(wireName: 'AVAIL:DateCreated')
  String get dateCreated;
  @BuiltValueField(wireName: 'AVAIL:Description')
  String? get description;
  @BuiltValueField(wireName: 'AVAIL:Keywords')
  BuiltList<String> get keywords;
  @BuiltValueField(wireName: 'AVAIL:Location')
  String? get location;
  @BuiltValueField(wireName: 'AVAIL:MediaType')
  String get mediaType;
  @BuiltValueField(wireName: 'AVAIL:NASAID')
  String get nasaId;
  @BuiltValueField(wireName: 'AVAIL:Photographer')
  String? get photographer;
  @BuiltValueField(wireName: 'AVAIL:Title')
  String get title;

  AssetMetadataModel._();
  factory AssetMetadataModel(
          [void Function(AssetMetadataModelBuilder) updates]) =
      _$AssetMetadataModel;

  Map<String, dynamic> toJson() {
    return (serializers.serializeWith(AssetMetadataModel.serializer, this))
        as Map<String, dynamic>;
  }

  static AssetMetadataModel? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AssetMetadataModel.serializer, json);
  }

  static Serializer<AssetMetadataModel> get serializer =>
      _$assetMetadataModelSerializer;
}
