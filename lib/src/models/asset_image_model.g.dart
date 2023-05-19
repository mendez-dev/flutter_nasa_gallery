// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_image_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AssetImageModel> _$assetImageModelSerializer =
    new _$AssetImageModelSerializer();

class _$AssetImageModelSerializer
    implements StructuredSerializer<AssetImageModel> {
  @override
  final Iterable<Type> types = const [AssetImageModel, _$AssetImageModel];
  @override
  final String wireName = 'AssetImageModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, AssetImageModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'href',
      serializers.serialize(object.href, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  AssetImageModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AssetImageModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'href':
          result.href = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AssetImageModel extends AssetImageModel {
  @override
  final String href;

  factory _$AssetImageModel([void Function(AssetImageModelBuilder)? updates]) =>
      (new AssetImageModelBuilder()..update(updates))._build();

  _$AssetImageModel._({required this.href}) : super._() {
    BuiltValueNullFieldError.checkNotNull(href, r'AssetImageModel', 'href');
  }

  @override
  AssetImageModel rebuild(void Function(AssetImageModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetImageModelBuilder toBuilder() =>
      new AssetImageModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetImageModel && href == other.href;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, href.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AssetImageModel')..add('href', href))
        .toString();
  }
}

class AssetImageModelBuilder
    implements Builder<AssetImageModel, AssetImageModelBuilder> {
  _$AssetImageModel? _$v;

  String? _href;
  String? get href => _$this._href;
  set href(String? href) => _$this._href = href;

  AssetImageModelBuilder();

  AssetImageModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _href = $v.href;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssetImageModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AssetImageModel;
  }

  @override
  void update(void Function(AssetImageModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AssetImageModel build() => _build();

  _$AssetImageModel _build() {
    final _$result = _$v ??
        new _$AssetImageModel._(
            href: BuiltValueNullFieldError.checkNotNull(
                href, r'AssetImageModel', 'href'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
