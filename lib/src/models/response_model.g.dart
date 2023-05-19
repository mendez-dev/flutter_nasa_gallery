// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ResponseModel> _$responseModelSerializer =
    new _$ResponseModelSerializer();

class _$ResponseModelSerializer implements StructuredSerializer<ResponseModel> {
  @override
  final Iterable<Type> types = const [ResponseModel, _$ResponseModel];
  @override
  final String wireName = 'ResponseModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, ResponseModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'code',
      serializers.serialize(object.code, specifiedType: const FullType(int)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.errors;
    if (value != null) {
      result
        ..add('errors')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(List, const [const FullType(String)])));
    }
    return result;
  }

  @override
  ResponseModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResponseModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'errors':
          result.errors = serializers.deserialize(value,
                  specifiedType:
                      const FullType(List, const [const FullType(String)]))
              as List<String>?;
          break;
      }
    }

    return result.build();
  }
}

class _$ResponseModel extends ResponseModel {
  @override
  final int code;
  @override
  final String message;
  @override
  final List<String>? errors;

  factory _$ResponseModel([void Function(ResponseModelBuilder)? updates]) =>
      (new ResponseModelBuilder()..update(updates))._build();

  _$ResponseModel._({required this.code, required this.message, this.errors})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(code, r'ResponseModel', 'code');
    BuiltValueNullFieldError.checkNotNull(message, r'ResponseModel', 'message');
  }

  @override
  ResponseModel rebuild(void Function(ResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResponseModelBuilder toBuilder() => new ResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResponseModel &&
        code == other.code &&
        message == other.message &&
        errors == other.errors;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, errors.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResponseModel')
          ..add('code', code)
          ..add('message', message)
          ..add('errors', errors))
        .toString();
  }
}

class ResponseModelBuilder
    implements Builder<ResponseModel, ResponseModelBuilder> {
  _$ResponseModel? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  List<String>? _errors;
  List<String>? get errors => _$this._errors;
  set errors(List<String>? errors) => _$this._errors = errors;

  ResponseModelBuilder();

  ResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _errors = $v.errors;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResponseModel;
  }

  @override
  void update(void Function(ResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResponseModel build() => _build();

  _$ResponseModel _build() {
    final _$result = _$v ??
        new _$ResponseModel._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'ResponseModel', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ResponseModel', 'message'),
            errors: errors);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
