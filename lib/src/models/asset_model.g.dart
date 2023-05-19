// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AssetModel> _$assetModelSerializer = new _$AssetModelSerializer();

class _$AssetModelSerializer implements StructuredSerializer<AssetModel> {
  @override
  final Iterable<Type> types = const [AssetModel, _$AssetModel];
  @override
  final String wireName = 'AssetModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, AssetModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'href',
      serializers.serialize(object.href, specifiedType: const FullType(String)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(
              BuiltList, const [const FullType(AssetDataModel)])),
      'links',
      serializers.serialize(object.links,
          specifiedType: const FullType(
              BuiltList, const [const FullType(AssetLinkModel)])),
    ];

    return result;
  }

  @override
  AssetModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AssetModelBuilder();

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
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AssetDataModel)]))!
              as BuiltList<Object?>);
          break;
        case 'links':
          result.links.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AssetLinkModel)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$AssetModel extends AssetModel {
  @override
  final String href;
  @override
  final BuiltList<AssetDataModel> data;
  @override
  final BuiltList<AssetLinkModel> links;

  factory _$AssetModel([void Function(AssetModelBuilder)? updates]) =>
      (new AssetModelBuilder()..update(updates))._build();

  _$AssetModel._({required this.href, required this.data, required this.links})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(href, r'AssetModel', 'href');
    BuiltValueNullFieldError.checkNotNull(data, r'AssetModel', 'data');
    BuiltValueNullFieldError.checkNotNull(links, r'AssetModel', 'links');
  }

  @override
  AssetModel rebuild(void Function(AssetModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetModelBuilder toBuilder() => new AssetModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetModel &&
        href == other.href &&
        data == other.data &&
        links == other.links;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, href.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, links.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AssetModel')
          ..add('href', href)
          ..add('data', data)
          ..add('links', links))
        .toString();
  }
}

class AssetModelBuilder implements Builder<AssetModel, AssetModelBuilder> {
  _$AssetModel? _$v;

  String? _href;
  String? get href => _$this._href;
  set href(String? href) => _$this._href = href;

  ListBuilder<AssetDataModel>? _data;
  ListBuilder<AssetDataModel> get data =>
      _$this._data ??= new ListBuilder<AssetDataModel>();
  set data(ListBuilder<AssetDataModel>? data) => _$this._data = data;

  ListBuilder<AssetLinkModel>? _links;
  ListBuilder<AssetLinkModel> get links =>
      _$this._links ??= new ListBuilder<AssetLinkModel>();
  set links(ListBuilder<AssetLinkModel>? links) => _$this._links = links;

  AssetModelBuilder();

  AssetModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _href = $v.href;
      _data = $v.data.toBuilder();
      _links = $v.links.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssetModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AssetModel;
  }

  @override
  void update(void Function(AssetModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AssetModel build() => _build();

  _$AssetModel _build() {
    _$AssetModel _$result;
    try {
      _$result = _$v ??
          new _$AssetModel._(
              href: BuiltValueNullFieldError.checkNotNull(
                  href, r'AssetModel', 'href'),
              data: data.build(),
              links: links.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
        _$failedField = 'links';
        links.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AssetModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
