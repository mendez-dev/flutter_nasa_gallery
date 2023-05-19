// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CollectionModel> _$collectionModelSerializer =
    new _$CollectionModelSerializer();

class _$CollectionModelSerializer
    implements StructuredSerializer<CollectionModel> {
  @override
  final Iterable<Type> types = const [CollectionModel, _$CollectionModel];
  @override
  final String wireName = 'CollectionModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, CollectionModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'version',
      serializers.serialize(object.version,
          specifiedType: const FullType(String)),
      'href',
      serializers.serialize(object.href, specifiedType: const FullType(String)),
      'items',
      serializers.serialize(object.items,
          specifiedType:
              const FullType(BuiltList, const [const FullType(AssetModel)])),
    ];

    return result;
  }

  @override
  CollectionModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CollectionModelBuilder();

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
                      BuiltList, const [const FullType(AssetModel)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$CollectionModel extends CollectionModel {
  @override
  final String version;
  @override
  final String href;
  @override
  final BuiltList<AssetModel> items;

  factory _$CollectionModel([void Function(CollectionModelBuilder)? updates]) =>
      (new CollectionModelBuilder()..update(updates))._build();

  _$CollectionModel._(
      {required this.version, required this.href, required this.items})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        version, r'CollectionModel', 'version');
    BuiltValueNullFieldError.checkNotNull(href, r'CollectionModel', 'href');
    BuiltValueNullFieldError.checkNotNull(items, r'CollectionModel', 'items');
  }

  @override
  CollectionModel rebuild(void Function(CollectionModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollectionModelBuilder toBuilder() =>
      new CollectionModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CollectionModel &&
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
    return (newBuiltValueToStringHelper(r'CollectionModel')
          ..add('version', version)
          ..add('href', href)
          ..add('items', items))
        .toString();
  }
}

class CollectionModelBuilder
    implements Builder<CollectionModel, CollectionModelBuilder> {
  _$CollectionModel? _$v;

  String? _version;
  String? get version => _$this._version;
  set version(String? version) => _$this._version = version;

  String? _href;
  String? get href => _$this._href;
  set href(String? href) => _$this._href = href;

  ListBuilder<AssetModel>? _items;
  ListBuilder<AssetModel> get items =>
      _$this._items ??= new ListBuilder<AssetModel>();
  set items(ListBuilder<AssetModel>? items) => _$this._items = items;

  CollectionModelBuilder();

  CollectionModelBuilder get _$this {
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
  void replace(CollectionModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CollectionModel;
  }

  @override
  void update(void Function(CollectionModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CollectionModel build() => _build();

  _$CollectionModel _build() {
    _$CollectionModel _$result;
    try {
      _$result = _$v ??
          new _$CollectionModel._(
              version: BuiltValueNullFieldError.checkNotNull(
                  version, r'CollectionModel', 'version'),
              href: BuiltValueNullFieldError.checkNotNull(
                  href, r'CollectionModel', 'href'),
              items: items.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CollectionModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
