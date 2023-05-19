// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_collection_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VideoCollectionResponse> _$videoCollectionResponseSerializer =
    new _$VideoCollectionResponseSerializer();

class _$VideoCollectionResponseSerializer
    implements StructuredSerializer<VideoCollectionResponse> {
  @override
  final Iterable<Type> types = const [
    VideoCollectionResponse,
    _$VideoCollectionResponse
  ];
  @override
  final String wireName = 'VideoCollectionResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, VideoCollectionResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'code',
      serializers.serialize(object.code, specifiedType: const FullType(int)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'data',
      serializers.serialize(object.data,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  VideoCollectionResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VideoCollectionResponseBuilder();

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
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$VideoCollectionResponse extends VideoCollectionResponse {
  @override
  final int code;
  @override
  final String message;
  @override
  final BuiltList<String> data;

  factory _$VideoCollectionResponse(
          [void Function(VideoCollectionResponseBuilder)? updates]) =>
      (new VideoCollectionResponseBuilder()..update(updates))._build();

  _$VideoCollectionResponse._(
      {required this.code, required this.message, required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        code, r'VideoCollectionResponse', 'code');
    BuiltValueNullFieldError.checkNotNull(
        message, r'VideoCollectionResponse', 'message');
    BuiltValueNullFieldError.checkNotNull(
        data, r'VideoCollectionResponse', 'data');
  }

  @override
  VideoCollectionResponse rebuild(
          void Function(VideoCollectionResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoCollectionResponseBuilder toBuilder() =>
      new VideoCollectionResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoCollectionResponse &&
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
    return (newBuiltValueToStringHelper(r'VideoCollectionResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class VideoCollectionResponseBuilder
    implements
        Builder<VideoCollectionResponse, VideoCollectionResponseBuilder> {
  _$VideoCollectionResponse? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<String>? _data;
  ListBuilder<String> get data => _$this._data ??= new ListBuilder<String>();
  set data(ListBuilder<String>? data) => _$this._data = data;

  VideoCollectionResponseBuilder();

  VideoCollectionResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoCollectionResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VideoCollectionResponse;
  }

  @override
  void update(void Function(VideoCollectionResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VideoCollectionResponse build() => _build();

  _$VideoCollectionResponse _build() {
    _$VideoCollectionResponse _$result;
    try {
      _$result = _$v ??
          new _$VideoCollectionResponse._(
              code: BuiltValueNullFieldError.checkNotNull(
                  code, r'VideoCollectionResponse', 'code'),
              message: BuiltValueNullFieldError.checkNotNull(
                  message, r'VideoCollectionResponse', 'message'),
              data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'VideoCollectionResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
