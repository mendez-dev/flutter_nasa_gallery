import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../utils/serializer.dart';

part 'video_collection_response.g.dart';

abstract class VideoCollectionResponse implements Built<VideoCollectionResponse, VideoCollectionResponseBuilder> {
  int get code;
  String get message;
  BuiltList<String> get data;

  VideoCollectionResponse._();
  factory VideoCollectionResponse([void Function(VideoCollectionResponseBuilder) updates]) = _$VideoCollectionResponse;

  Map<String, dynamic> toJson() {
    return (serializers.serializeWith(VideoCollectionResponse.serializer, this))
        as Map<String, dynamic>;
  }

  static VideoCollectionResponse? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(VideoCollectionResponse.serializer, json);
  }

  static Serializer<VideoCollectionResponse> get serializer => _$videoCollectionResponseSerializer;
}