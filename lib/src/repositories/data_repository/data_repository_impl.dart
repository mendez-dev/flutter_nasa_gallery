import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:nasa_app/src/models/asset_image_list_response.dart';
import 'package:nasa_app/src/models/asset_metadata_response.dart';
import 'package:nasa_app/src/models/collection_response.dart';
import 'package:nasa_app/src/models/video_collection_response.dart';
import 'package:nasa_app/src/repositories/data_repository/data_repository.dart';
import 'package:nasa_app/src/repositories/network_repository/network_repository.dart';
import 'package:path_provider/path_provider.dart';

import '../../models/asset_model.dart';
import '../../utils/logger.dart';

class DataRepositoryImpl implements DataRepository {
  final NetworkRepository _network;

  DataRepositoryImpl({required NetworkRepository networkRepository})
      : _network = networkRepository;

  @override
  Future<CollectionResponse> getRecent() async {
    final response = await _network.instance.get(
      '/recent.json',
    );
    if (response.data['data']?['collection'] != null) {
      response.data['data'] = response.data['data']['collection'];
    }

    CollectionResponse collectionResponse =
        CollectionResponse.fromJson(response.data)!;

    return collectionResponse;
  }

  @override
  Future<AssetMetadataResponse> getAssetMetadata(
      {required String id, String type = 'image'}) async {
    final response = await _network.instance.get(
      '/$type/$id/metadata.json',
    );

    try {
      AssetMetadataResponse assetMetadataResponse =
          AssetMetadataResponse.fromJson(response.data)!;
      return assetMetadataResponse;
    } catch (e) {
      return AssetMetadataResponse((b) => b
        ..code = 404
        ..message = 'Not found');
    }
  }

  @override
  Future<AssetImageListResponse> getAssetImages({required String id}) async {
    final response = await _network.instance.get(
      '/asset/$id',
    );
    if (response.data['data']?['collection'] != null) {
      response.data['data'] = response.data['data']['collection'];
    }

    AssetImageListResponse assetImageListResponse =
        AssetImageListResponse.fromJson(response.data)!;
    return assetImageListResponse;
  }

  @override
  Future<CollectionResponse> getPopular() async {
    final response = await _network.instance.get(
      '/popular.json',
    );
    if (response.data['data']?['collection'] != null) {
      response.data['data'] = response.data['data']['collection'];
    }

    CollectionResponse collectionResponse =
        CollectionResponse.fromJson(response.data)!;

    return collectionResponse;
  }

  @override
  Future<VideoCollectionResponse> getVideos({required String id}) async {
    final response = await _network.instance.get('/video/$id/collection.json');
    VideoCollectionResponse videoCollectionResponse =
        VideoCollectionResponse.fromJson(response.data)!;
    return videoCollectionResponse;
  }

  @override
  Future<void> donloadRandomImages() async {
    // Verificamos si las imagenes ya fueron descargadas
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/image0.jpg';

    File file = File(filePath);

    if (file.existsSync()) {
      logger.i("Las imagenes ya fueron descargadas");
      return;
    }

    // Nueva instancia de dio para descargar las imagenes
    Dio dio = Dio();

    CollectionResponse collectionResponse = await getRecent();

    if (collectionResponse.code == 200) {
      BuiltList<AssetModel> items = collectionResponse.data!.items;

      // Mesclamos a lista de itens
      items = items.rebuild((b) => b..shuffle());

      // Filtramos los items para que sean de tipo imagen
      items = items.rebuild(
          (b) => b..where((item) => item.links.first.render == 'image'));

      // Descargamos las primeras 5 imagenes y las guardamos en la carpeta de descargas
      for (int i = 0; i < 10; i++) {
        final Directory directory = await getApplicationDocumentsDirectory();
        final String filePath = '${directory.path}/image$i.jpg';
        AssetModel item = items[i];

        String url = item.links.first.href;

        await dio.download(url, filePath);
      }

      logger.i("Descarga de imagenes finalizada");
    }
  }

  @override
  Future<List<File>> getDownloadedImages() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    List<File> files = [];

    for (int i = 0; i < 10; i++) {
      final String filePath = '${directory.path}/image$i.jpg';
      File file = File(filePath);
      if (file.existsSync()) {
        files.add(file);
      }
    }

    return files;
  }

  @override
  Future<CollectionResponse> search(
      {required String query,
      required int initialYear,
      required int finalYear,
      required bool showImages,
      required bool showVideos}) {
    // https://images-api.nasa.gov/search?q=orion&page=1&media_type=image,video,audio&year_start=1920&year_end=2023
    String mediaType = '';
    if (showImages && showVideos) {
      mediaType = 'image,video';
    } else if (showImages) {
      mediaType = 'image';
    } else if (showVideos) {
      mediaType = 'video';
    }

    return _network.instance.get('/search', queryParameters: {
      'q': query,
      'media_type': mediaType,
      'year_start': initialYear,
      'year_end': finalYear,
    }).then((response) {
      if (response.data['data']?['collection'] != null) {
        response.data['data'] = response.data['data']['collection'];
      }

      CollectionResponse collectionResponse =
          CollectionResponse.fromJson(response.data)!;

      return collectionResponse;
    });
  }
}
