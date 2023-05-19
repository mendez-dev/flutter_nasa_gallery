// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CollectionResponse> _$collectionResponseSerializer =
    new _$CollectionResponseSerializer();

class _$CollectionResponseSerializer
    implements StructuredSerializer<CollectionResponse> {
  @override
  final Iterable<Type> types = const [CollectionResponse, _$CollectionResponse];
  @override
  final String wireName = 'CollectionResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CollectionResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'code',
      serializers.serialize(object.code, specifiedType: const FullType(int)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(CollectionModel)));
    }
    return result;
  }

  @override
  CollectionResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CollectionResponseBuilder();

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
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(CollectionModel))!
              as CollectionModel);
          break;
      }
    }

    return result.build();
  }
}

class _$CollectionResponse extends CollectionResponse {
  @override
  final int code;
  @override
  final String message;
  @override
  final CollectionModel? data;

  factory _$CollectionResponse(
          [void Function(CollectionResponseBuilder)? updates]) =>
      (new CollectionResponseBuilder()..update(updates))._build();

  _$CollectionResponse._({required this.code, required this.message, this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(code, r'CollectionResponse', 'code');
    BuiltValueNullFieldError.checkNotNull(
        message, r'CollectionResponse', 'message');
  }

  @override
  CollectionResponse rebuild(
          void Function(CollectionResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollectionResponseBuilder toBuilder() =>
      new CollectionResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CollectionResponse &&
        code == other.code &&
        message == other.message &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CollectionResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class CollectionResponseBuilder
    implements Builder<CollectionResponse, CollectionResponseBuilder> {
  _$CollectionResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  CollectionModelBuilder? _data;
  CollectionModelBuilder get data =>
      _$this._data ??= new CollectionModelBuilder();
  set data(CollectionModelBuilder? data) => _$this._data = data;

  CollectionResponseBuilder();

  CollectionResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CollectionResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CollectionResponse;
  }

  @override
  void update(void Function(CollectionResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CollectionResponse build() => _build();

  _$CollectionResponse _build() {
    _$CollectionResponse _$result;
    try {
      _$result = _$v ??
          new _$CollectionResponse._(
              code: BuiltValueNullFieldError.checkNotNull(
                  code, r'CollectionResponse', 'code'),
              message: BuiltValueNullFieldError.checkNotNull(
                  message, r'CollectionResponse', 'message'),
              data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CollectionResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
