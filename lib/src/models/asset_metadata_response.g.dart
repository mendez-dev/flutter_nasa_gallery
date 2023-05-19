// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_metadata_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AssetMetadataResponse> _$assetMetadataResponseSerializer =
    new _$AssetMetadataResponseSerializer();

class _$AssetMetadataResponseSerializer
    implements StructuredSerializer<AssetMetadataResponse> {
  @override
  final Iterable<Type> types = const [
    AssetMetadataResponse,
    _$AssetMetadataResponse
  ];
  @override
  final String wireName = 'AssetMetadataResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AssetMetadataResponse object,
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
            specifiedType: const FullType(AssetMetadataModel)));
    }
    return result;
  }

  @override
  AssetMetadataResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AssetMetadataResponseBuilder();

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
                  specifiedType: const FullType(AssetMetadataModel))!
              as AssetMetadataModel);
          break;
      }
    }

    return result.build();
  }
}

class _$AssetMetadataResponse extends AssetMetadataResponse {
  @override
  final int code;
  @override
  final String message;
  @override
  final AssetMetadataModel? data;

  factory _$AssetMetadataResponse(
          [void Function(AssetMetadataResponseBuilder)? updates]) =>
      (new AssetMetadataResponseBuilder()..update(updates))._build();

  _$AssetMetadataResponse._(
      {required this.code, required this.message, this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        code, r'AssetMetadataResponse', 'code');
    BuiltValueNullFieldError.checkNotNull(
        message, r'AssetMetadataResponse', 'message');
  }

  @override
  AssetMetadataResponse rebuild(
          void Function(AssetMetadataResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetMetadataResponseBuilder toBuilder() =>
      new AssetMetadataResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetMetadataResponse &&
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
    return (newBuiltValueToStringHelper(r'AssetMetadataResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class AssetMetadataResponseBuilder
    implements Builder<AssetMetadataResponse, AssetMetadataResponseBuilder> {
  _$AssetMetadataResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  AssetMetadataModelBuilder? _data;
  AssetMetadataModelBuilder get data =>
      _$this._data ??= new AssetMetadataModelBuilder();
  set data(AssetMetadataModelBuilder? data) => _$this._data = data;

  AssetMetadataResponseBuilder();

  AssetMetadataResponseBuilder get _$this {
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
  void replace(AssetMetadataResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AssetMetadataResponse;
  }

  @override
  void update(void Function(AssetMetadataResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AssetMetadataResponse build() => _build();

  _$AssetMetadataResponse _build() {
    _$AssetMetadataResponse _$result;
    try {
      _$result = _$v ??
          new _$AssetMetadataResponse._(
              code: BuiltValueNullFieldError.checkNotNull(
                  code, r'AssetMetadataResponse', 'code'),
              message: BuiltValueNullFieldError.checkNotNull(
                  message, r'AssetMetadataResponse', 'message'),
              data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AssetMetadataResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
