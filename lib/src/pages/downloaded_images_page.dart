import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_app/src/repositories/data_repository/data_repository.dart';

class DownloadedImagesPage extends StatefulWidget {
  const DownloadedImagesPage({super.key});

  @override
  State<DownloadedImagesPage> createState() => _DownloadedImagesPageState();
}

class _DownloadedImagesPageState extends State<DownloadedImagesPage> {
  List<File> images = [];
  bool isLoading = true;

  @override
  void initState() {
    loadImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          final imageFile = images[index];
          return Image.file(imageFile);
        },
      ),
    ));
  }

  Future<void> loadImages() async {
    setState(() {
      isLoading = true;
    });
    final response = await RepositoryProvider.of<DataRepository>(context)
        .getDownloadedImages();

    setState(() {
      images = response;
      isLoading = false;
    });
  }
}
