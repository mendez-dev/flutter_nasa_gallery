// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_metadata_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AssetMetadataModel> _$assetMetadataModelSerializer =
    new _$AssetMetadataModelSerializer();

class _$AssetMetadataModelSerializer
    implements StructuredSerializer<AssetMetadataModel> {
  @override
  final Iterable<Type> types = const [AssetMetadataModel, _$AssetMetadataModel];
  @override
  final String wireName = 'AssetMetadataModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AssetMetadataModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'AVAIL:DateCreated',
      serializers.serialize(object.dateCreated,
          specifiedType: const FullType(String)),
      'AVAIL:Keywords',
      serializers.serialize(object.keywords,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'AVAIL:MediaType',
      serializers.serialize(object.mediaType,
          specifiedType: const FullType(String)),
      'AVAIL:NASAID',
      serializers.serialize(object.nasaId,
          specifiedType: const FullType(String)),
      'AVAIL:Title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.center;
    if (value != null) {
      result
        ..add('AVAIL:Center')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('AVAIL:Description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('AVAIL:Location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photographer;
    if (value != null) {
      result
        ..add('AVAIL:Photographer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AssetMetadataModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AssetMetadataModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'AVAIL:Center':
          result.center = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'AVAIL:DateCreated':
          result.dateCreated = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'AVAIL:Description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'AVAIL:Keywords':
          result.keywords.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'AVAIL:Location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'AVAIL:MediaType':
          result.mediaType = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'AVAIL:NASAID':
          result.nasaId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'AVAIL:Photographer':
          result.photographer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'AVAIL:Title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AssetMetadataModel extends AssetMetadataModel {
  @override
  final String? center;
  @override
  final String dateCreated;
  @override
  final String? description;
  @override
  final BuiltList<String> keywords;
  @override
  final String? location;
  @override
  final String mediaType;
  @override
  final String nasaId;
  @override
  final String? photographer;
  @override
  final String title;

  factory _$AssetMetadataModel(
          [void Function(AssetMetadataModelBuilder)? updates]) =>
      (new AssetMetadataModelBuilder()..update(updates))._build();

  _$AssetMetadataModel._(
      {this.center,
      required this.dateCreated,
      this.description,
      required this.keywords,
      this.location,
      required this.mediaType,
      required this.nasaId,
      this.photographer,
      required this.title})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        dateCreated, r'AssetMetadataModel', 'dateCreated');
    BuiltValueNullFieldError.checkNotNull(
        keywords, r'AssetMetadataModel', 'keywords');
    BuiltValueNullFieldError.checkNotNull(
        mediaType, r'AssetMetadataModel', 'mediaType');
    BuiltValueNullFieldError.checkNotNull(
        nasaId, r'AssetMetadataModel', 'nasaId');
    BuiltValueNullFieldError.checkNotNull(
        title, r'AssetMetadataModel', 'title');
  }

  @override
  AssetMetadataModel rebuild(
          void Function(AssetMetadataModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetMetadataModelBuilder toBuilder() =>
      new AssetMetadataModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetMetadataModel &&
        center == other.center &&
        dateCreated == other.dateCreated &&
        description == other.description &&
        keywords == other.keywords &&
        location == other.location &&
        mediaType == other.mediaType &&
        nasaId == other.nasaId &&
        photographer == other.photographer &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, center.hashCode);
    _$hash = $jc(_$hash, dateCreated.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, keywords.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, mediaType.hashCode);
    _$hash = $jc(_$hash, nasaId.hashCode);
    _$hash = $jc(_$hash, photographer.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AssetMetadataModel')
          ..add('center', center)
          ..add('dateCreated', dateCreated)
          ..add('description', description)
          ..add('keywords', keywords)
          ..add('location', location)
          ..add('mediaType', mediaType)
          ..add('nasaId', nasaId)
          ..add('photographer', photographer)
          ..add('title', title))
        .toString();
  }
}

class AssetMetadataModelBuilder
    implements Builder<AssetMetadataModel, AssetMetadataModelBuilder> {
  _$AssetMetadataModel? _$v;

  String? _center;
  String? get center => _$this._center;
  set center(String? center) => _$this._center = center;

  String? _dateCreated;
  String? get dateCreated => _$this._dateCreated;
  set dateCreated(String? dateCreated) => _$this._dateCreated = dateCreated;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ListBuilder<String>? _keywords;
  ListBuilder<String> get keywords =>
      _$this._keywords ??= new ListBuilder<String>();
  set keywords(ListBuilder<String>? keywords) => _$this._keywords = keywords;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  String? _mediaType;
  String? get mediaType => _$this._mediaType;
  set mediaType(String? mediaType) => _$this._mediaType = mediaType;

  String? _nasaId;
  String? get nasaId => _$this._nasaId;
  set nasaId(String? nasaId) => _$this._nasaId = nasaId;

  String? _photographer;
  String? get photographer => _$this._photographer;
  set photographer(String? photographer) => _$this._photographer = photographer;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  AssetMetadataModelBuilder();

  AssetMetadataModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _center = $v.center;
      _dateCreated = $v.dateCreated;
      _description = $v.description;
      _keywords = $v.keywords.toBuilder();
      _location = $v.location;
      _mediaType = $v.mediaType;
      _nasaId = $v.nasaId;
      _photographer = $v.photographer;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssetMetadataModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AssetMetadataModel;
  }

  @override
  void update(void Function(AssetMetadataModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AssetMetadataModel build() => _build();

  _$AssetMetadataModel _build() {
    _$AssetMetadataModel _$result;
    try {
      _$result = _$v ??
          new _$AssetMetadataModel._(
              center: center,
              dateCreated: BuiltValueNullFieldError.checkNotNull(
                  dateCreated, r'AssetMetadataModel', 'dateCreated'),
              description: description,
              keywords: keywords.build(),
              location: location,
              mediaType: BuiltValueNullFieldError.checkNotNull(
                  mediaType, r'AssetMetadataModel', 'mediaType'),
              nasaId: BuiltValueNullFieldError.checkNotNull(
                  nasaId, r'AssetMetadataModel', 'nasaId'),
              photographer: photographer,
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'AssetMetadataModel', 'title'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'keywords';
        keywords.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AssetMetadataModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
