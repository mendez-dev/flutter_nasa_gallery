import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/src/pages/home_page.dart';

import '../pages/image_detail_page.dart';

class RoutesHandler {
  FluroRouter router = FluroRouter();

  RoutesHandler() {
    configureRoutes(router);
  }
  static void configureRoutes(FluroRouter router) {
    // Define 404 handler
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Page not found'),
        ),
        body: const Center(
          child: Text('Page not found'),
        ),
      );
    });

    // Define routes
    router.define(
      '/',
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
          return const HomePage();
        },
      ),
    );
    router.define('/image-detail/:id/:type', handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        return ImageDetailPage(
          id: params["id"]!.first,
          type: params["type"]!.first,
        );
      },
    ));
  }
}
