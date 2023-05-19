import 'package:flutter/material.dart';
import 'package:nasa_app/src/app.dart';
import 'package:nasa_app/src/notifications/notification_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initNotifications();
  runApp(const MyApp());
}
