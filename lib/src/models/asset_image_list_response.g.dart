// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_image_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AssetImageListResponse> _$assetImageListResponseSerializer =
    new _$AssetImageListResponseSerializer();

class _$AssetImageListResponseSerializer
    implements StructuredSerializer<AssetImageListResponse> {
  @override
  final Iterable<Type> types = const [
    AssetImageListResponse,
    _$AssetImageListResponse
  ];
  @override
  final String wireName = 'AssetImageListResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AssetImageListResponse object,
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
            specifiedType: const FullType(AssetImageListModel)));
    }
    return result;
  }

  @override
  AssetImageListResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AssetImageListResponseBuilder();

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
                  specifiedType: const FullType(AssetImageListModel))!
              as AssetImageListModel);
          break;
      }
    }

    return result.build();
  }
}

class _$AssetImageListResponse extends AssetImageListResponse {
  @override
  final int code;
  @override
  final String message;
  @override
  final AssetImageListModel? data;

  factory _$AssetImageListResponse(
          [void Function(AssetImageListResponseBuilder)? updates]) =>
      (new AssetImageListResponseBuilder()..update(updates))._build();

  _$AssetImageListResponse._(
      {required this.code, required this.message, this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        code, r'AssetImageListResponse', 'code');
    BuiltValueNullFieldError.checkNotNull(
        message, r'AssetImageListResponse', 'message');
  }

  @override
  AssetImageListResponse rebuild(
          void Function(AssetImageListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetImageListResponseBuilder toBuilder() =>
      new AssetImageListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetImageListResponse &&
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
    return (newBuiltValueToStringHelper(r'AssetImageListResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class AssetImageListResponseBuilder
    implements Builder<AssetImageListResponse, AssetImageListResponseBuilder> {
  _$AssetImageListResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  AssetImageListModelBuilder? _data;
  AssetImageListModelBuilder get data =>
      _$this._data ??= new AssetImageListModelBuilder();
  set data(AssetImageListModelBuilder? data) => _$this._data = data;

  AssetImageListResponseBuilder();

  AssetImageListResponseBuilder get _$this {
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
  void replace(AssetImageListResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AssetImageListResponse;
  }

  @override
  void update(void Function(AssetImageListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AssetImageListResponse build() => _build();

  _$AssetImageListResponse _build() {
    _$AssetImageListResponse _$result;
    try {
      _$result = _$v ??
          new _$AssetImageListResponse._(
              code: BuiltValueNullFieldError.checkNotNull(
                  code, r'AssetImageListResponse', 'code'),
              message: BuiltValueNullFieldError.checkNotNull(
                  message, r'AssetImageListResponse', 'message'),
              data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AssetImageListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
