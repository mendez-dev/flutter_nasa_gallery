// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_image_list_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AssetImageListModel> _$assetImageListModelSerializer =
    new _$AssetImageListModelSerializer();

class _$AssetImageListModelSerializer
    implements StructuredSerializer<AssetImageListModel> {
  @override
  final Iterable<Type> types = const [
    AssetImageListModel,
    _$AssetImageListModel
  ];
  @override
  final String wireName = 'AssetImageListModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AssetImageListModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'version',
      serializers.serialize(object.version,
          specifiedType: const FullType(String)),
      'href',
      serializers.serialize(object.href, specifiedType: const FullType(String)),
      'items',
      serializers.serialize(object.items,
          specifiedType: const FullType(
              BuiltList, const [const FullType(AssetImageModel)])),
    ];

    return result;
  }

  @override
  AssetImageListModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AssetImageListModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'version':
          result.version = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'href':
          result.href = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'items':
          result.items.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AssetImageModel)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$AssetImageListModel extends AssetImageListModel {
  @override
  final String version;
  @override
  final String href;
  @override
  final BuiltList<AssetImageModel> items;

  factory _$AssetImageListModel(
          [void Function(AssetImageListModelBuilder)? updates]) =>
      (new AssetImageListModelBuilder()..update(updates))._build();

  _$AssetImageListModel._(
      {required this.version, required this.href, required this.items})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        version, r'AssetImageListModel', 'version');
    BuiltValueNullFieldError.checkNotNull(href, r'AssetImageListModel', 'href');
    BuiltValueNullFieldError.checkNotNull(
        items, r'AssetImageListModel', 'items');
  }

  @override
  AssetImageListModel rebuild(
          void Function(AssetImageListModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetImageListModelBuilder toBuilder() =>
      new AssetImageListModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetImageListModel &&
        version == other.version &&
        href == other.href &&
        items == other.items;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, href.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AssetImageListModel')
          ..add('version', version)
          ..add('href', href)
          ..add('items', items))
        .toString();
  }
}

class AssetImageListModelBuilder
    implements Builder<AssetImageListModel, AssetImageListModelBuilder> {
  _$AssetImageListModel? _$v;

  String? _version;
  String? get version => _$this._version;
  set version(String? version) => _$this._version = version;

  String? _href;
  String? get href => _$this._href;
  set href(String? href) => _$this._href = href;

  ListBuilder<AssetImageModel>? _items;
  ListBuilder<AssetImageModel> get items =>
      _$this._items ??= new ListBuilder<AssetImageModel>();
  set items(ListBuilder<AssetImageModel>? items) => _$this._items = items;

  AssetImageListModelBuilder();

  AssetImageListModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _version = $v.version;
      _href = $v.href;
      _items = $v.items.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssetImageListModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AssetImageListModel;
  }

  @override
  void update(void Function(AssetImageListModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AssetImageListModel build() => _build();

  _$AssetImageListModel _build() {
    _$AssetImageListModel _$result;
    try {
      _$result = _$v ??
          new _$AssetImageListModel._(
              version: BuiltValueNullFieldError.checkNotNull(
                  version, r'AssetImageListModel', 'version'),
              href: BuiltValueNullFieldError.checkNotNull(
                  href, r'AssetImageListModel', 'href'),
              items: items.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AssetImageListModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
