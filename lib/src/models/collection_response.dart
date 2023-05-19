import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nasa_app/src/models/collection_model.dart';

import '../utils/serializer.dart';

part 'collection_response.g.dart';

abstract class CollectionResponse implements Built<CollectionResponse, CollectionResponseBuilder> {
  int get code;
  String get message;
  CollectionModel? get data;

  CollectionResponse._();
  factory CollectionResponse([void Function(CollectionResponseBuilder) updates]) = _$CollectionResponse;

  Map<String, dynamic> toJson() {
    return (serializers.serializeWith(CollectionResponse.serializer, this))
        as Map<String, dynamic>;
  }

  static CollectionResponse? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(CollectionResponse.serializer, json);
  }

  static Serializer<CollectionResponse> get serializer => _$collectionResponseSerializer;
}