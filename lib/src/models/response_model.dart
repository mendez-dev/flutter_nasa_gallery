import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '../utils/serializer.dart';

part 'response_model.g.dart';

abstract class ResponseModel
    implements Built<ResponseModel, ResponseModelBuilder> {
  int get code;
  String get message;
  List<String>? get errors;

  ResponseModel._();
  factory ResponseModel([void Function(ResponseModelBuilder) updates]) =
      _$ResponseModel;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ResponseModel.serializer, this)
        as Map<String, dynamic>;
  }

  static ResponseModel? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ResponseModel.serializer, json);
  }

  static Serializer<ResponseModel> get serializer => _$responseModelSerializer;
}
