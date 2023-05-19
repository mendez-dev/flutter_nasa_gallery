// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_data_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AssetDataModel> _$assetDataModelSerializer =
    new _$AssetDataModelSerializer();

class _$AssetDataModelSerializer
    implements StructuredSerializer<AssetDataModel> {
  @override
  final Iterable<Type> types = const [AssetDataModel, _$AssetDataModel];
  @override
  final String wireName = 'AssetDataModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, AssetDataModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'date_created',
      serializers.serialize(object.dateCreated,
          specifiedType: const FullType(String)),
      'keywords',
      serializers.serialize(object.keywords,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'media_type',
      serializers.serialize(object.mediaType,
          specifiedType: const FullType(String)),
      'nasa_id',
      serializers.serialize(object.nasaId,
          specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.center;
    if (value != null) {
      result
        ..add('center')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photographer;
    if (value != null) {
      result
        ..add('photographer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AssetDataModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AssetDataModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'center':
          result.center = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date_created':
          result.dateCreated = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'keywords':
          result.keywords.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'media_type':
          result.mediaType = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'nasa_id':
          result.nasaId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'photographer':
          result.photographer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AssetDataModel extends AssetDataModel {
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

  factory _$AssetDataModel([void Function(AssetDataModelBuilder)? updates]) =>
      (new AssetDataModelBuilder()..update(updates))._build();

  _$AssetDataModel._(
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
        dateCreated, r'AssetDataModel', 'dateCreated');
    BuiltValueNullFieldError.checkNotNull(
        keywords, r'AssetDataModel', 'keywords');
    BuiltValueNullFieldError.checkNotNull(
        mediaType, r'AssetDataModel', 'mediaType');
    BuiltValueNullFieldError.checkNotNull(nasaId, r'AssetDataModel', 'nasaId');
    BuiltValueNullFieldError.checkNotNull(title, r'AssetDataModel', 'title');
  }

  @override
  AssetDataModel rebuild(void Function(AssetDataModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetDataModelBuilder toBuilder() =>
      new AssetDataModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetDataModel &&
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
    return (newBuiltValueToStringHelper(r'AssetDataModel')
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

class AssetDataModelBuilder
    implements Builder<AssetDataModel, AssetDataModelBuilder> {
  _$AssetDataModel? _$v;

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

  AssetDataModelBuilder();

  AssetDataModelBuilder get _$this {
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
  void replace(AssetDataModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AssetDataModel;
  }

  @override
  void update(void Function(AssetDataModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AssetDataModel build() => _build();

  _$AssetDataModel _build() {
    _$AssetDataModel _$result;
    try {
      _$result = _$v ??
          new _$AssetDataModel._(
              center: center,
              dateCreated: BuiltValueNullFieldError.checkNotNull(
                  dateCreated, r'AssetDataModel', 'dateCreated'),
              description: description,
              keywords: keywords.build(),
              location: location,
              mediaType: BuiltValueNullFieldError.checkNotNull(
                  mediaType, r'AssetDataModel', 'mediaType'),
              nasaId: BuiltValueNullFieldError.checkNotNull(
                  nasaId, r'AssetDataModel', 'nasaId'),
              photographer: photographer,
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'AssetDataModel', 'title'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'keywords';
        keywords.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AssetDataModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
