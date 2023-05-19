import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../utils/serializer.dart';
import 'asset_model.dart';

part 'collection_model.g.dart';

abstract class CollectionModel
    implements Built<CollectionModel, CollectionModelBuilder> {
  String get version;
  String get href;
  BuiltList<AssetModel> get items;

  CollectionModel._();
  factory CollectionModel([void Function(CollectionModelBuilder) updates]) =
      _$CollectionModel;

  Map<String, dynamic> toJson() {
    return (serializers.serializeWith(CollectionModel.serializer, this))
        as Map<String, dynamic>;
  }

  static CollectionModel? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(CollectionModel.serializer, json);
  }

  static Serializer<CollectionModel> get serializer =>
      _$collectionModelSerializer;
}
