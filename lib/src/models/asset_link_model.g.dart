// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_link_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AssetLinkModel> _$assetLinkModelSerializer =
    new _$AssetLinkModelSerializer();

class _$AssetLinkModelSerializer
    implements StructuredSerializer<AssetLinkModel> {
  @override
  final Iterable<Type> types = const [AssetLinkModel, _$AssetLinkModel];
  @override
  final String wireName = 'AssetLinkModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, AssetLinkModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'href',
      serializers.serialize(object.href, specifiedType: const FullType(String)),
      'rel',
      serializers.serialize(object.rel, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.render;
    if (value != null) {
      result
        ..add('render')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AssetLinkModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AssetLinkModelBuilder();

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
        case 'rel':
          result.rel = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'render':
          result.render = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$AssetLinkModel extends AssetLinkModel {
  @override
  final String href;
  @override
  final String rel;
  @override
  final String? render;

  factory _$AssetLinkModel([void Function(AssetLinkModelBuilder)? updates]) =>
      (new AssetLinkModelBuilder()..update(updates))._build();

  _$AssetLinkModel._({required this.href, required this.rel, this.render})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(href, r'AssetLinkModel', 'href');
    BuiltValueNullFieldError.checkNotNull(rel, r'AssetLinkModel', 'rel');
  }

  @override
  AssetLinkModel rebuild(void Function(AssetLinkModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetLinkModelBuilder toBuilder() =>
      new AssetLinkModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetLinkModel &&
        href == other.href &&
        rel == other.rel &&
        render == other.render;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, href.hashCode);
    _$hash = $jc(_$hash, rel.hashCode);
    _$hash = $jc(_$hash, render.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AssetLinkModel')
          ..add('href', href)
          ..add('rel', rel)
          ..add('render', render))
        .toString();
  }
}

class AssetLinkModelBuilder
    implements Builder<AssetLinkModel, AssetLinkModelBuilder> {
  _$AssetLinkModel? _$v;

  String? _href;
  String? get href => _$this._href;
  set href(String? href) => _$this._href = href;

  String? _rel;
  String? get rel => _$this._rel;
  set rel(String? rel) => _$this._rel = rel;

  String? _render;
  String? get render => _$this._render;
  set render(String? render) => _$this._render = render;

  AssetLinkModelBuilder();

  AssetLinkModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _href = $v.href;
      _rel = $v.rel;
      _render = $v.render;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssetLinkModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AssetLinkModel;
  }

  @override
  void update(void Function(AssetLinkModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AssetLinkModel build() => _build();

  _$AssetLinkModel _build() {
    final _$result = _$v ??
        new _$AssetLinkModel._(
            href: BuiltValueNullFieldError.checkNotNull(
                href, r'AssetLinkModel', 'href'),
            rel: BuiltValueNullFieldError.checkNotNull(
                rel, r'AssetLinkModel', 'rel'),
            render: render);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
