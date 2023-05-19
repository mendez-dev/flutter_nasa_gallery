import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nasa_app/src/models/asset_model.dart';
import 'package:nasa_app/src/repositories/data_repository/data_repository.dart';
import 'package:path_provider/path_provider.dart';

import '../models/collection_response.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');
  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

/// Almacena la imagen en el dispositivo para poder mostrarla en la notificación
Future<String> _downloadAndSaveFile(String url, String fileName) async {
  // Creamos una instancia de DIO para descargar el archivo
  final Dio dio = Dio();

  final Directory directory = await getApplicationDocumentsDirectory();
  final String filePath = '${directory.path}/$fileName';
  final Response response = await dio.get(
    url,
    options: Options(responseType: ResponseType.bytes),
  );
  final File file = File(filePath);
  await file.writeAsBytes(response.data);
  return filePath;
}

Future<void> showBigPictureNotification(
    {required DataRepository dataRepository}) async {
  final CollectionResponse response = await dataRepository.getRecent();

  if (response.code != 200) {
    return;
  }

  BuiltList<AssetModel> items = response.data!.items;

  // Obtenemos una imagen aleatoria
  items = items.rebuild((b) => b..shuffle());
  final AssetModel asset = items[0];

  // Descargamos la imagen

  final String bigPicturePath =
      await _downloadAndSaveFile(asset.links.first.href, 'bigPicture');

  // Definimos el estilo de la notificacion
  final BigPictureStyleInformation bigPictureStyleInformation =
      BigPictureStyleInformation(FilePathAndroidBitmap(bigPicturePath),
          contentTitle: asset.data.first.title,
          htmlFormatContentTitle: true,
          summaryText: asset.data.first.description,
          htmlFormatSummaryText: true);

  // Definimos la notificación
  final AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails('random_image', 'Random Image',
          channelDescription: 'Random Image of the Day',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
          styleInformation: bigPictureStyleInformation);

  // Creamos la notificación
  final NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);

  // Mostramos la notifiacion
  await flutterLocalNotificationsPlugin.show(
      0, 'Random image', 'random image', notificationDetails);
}

Future<void> showNotification() async {
  // Definimos la notificación
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'random_image',
    'Random Image',
    channelDescription: 'Random Image of the Day',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
    styleInformation: BigPictureStyleInformation(
      FilePathAndroidBitmap('https://picsum.photos/250/300'),
      contentTitle: 'NASA Image of the Day',
    ),
  );

  // Creamos la notificación
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  // Mostramos la notifiacion
  await flutterLocalNotificationsPlugin.show(
    0,
    'NASA Image of the Day',
    'Please check out today\'s image!',
    platformChannelSpecifics,
  );
}
