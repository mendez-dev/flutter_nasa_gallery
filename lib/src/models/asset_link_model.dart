import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../utils/serializer.dart';

part 'asset_link_model.g.dart';

abstract class AssetLinkModel
    implements Built<AssetLinkModel, AssetLinkModelBuilder> {
  String get href;
  String get rel;
  String? get render;

  AssetLinkModel._();
  factory AssetLinkModel([void Function(AssetLinkModelBuilder) updates]) =
      _$AssetLinkModel;

  Map<String, dynamic> toJson() {
    return (serializers.serializeWith(AssetLinkModel.serializer, this))
        as Map<String, dynamic>;
  }

  static AssetLinkModel? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AssetLinkModel.serializer, json);
  }

  static Serializer<AssetLinkModel> get serializer =>
      _$assetLinkModelSerializer;
}
