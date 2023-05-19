import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/asset_image_list_model.dart';
import '../repositories/data_repository/data_repository.dart';

class ImageDetailHeader extends StatefulWidget {
  final String id;
  const ImageDetailHeader({
    super.key,
    required this.id,
  });

  @override
  State<ImageDetailHeader> createState() => _ImageDetailHeaderState();
}

class _ImageDetailHeaderState extends State<ImageDetailHeader> {
  bool isLoading = false;

  late AssetImageListModel assetImageList;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Builder(builder: (BuildContext context) {
          if (isLoading) {
            // Shimemr effect
            return Hero(
              tag: widget.id,
              child: SizedBox(
                height: 300,
                width: double.infinity,
                child: CachedNetworkImage(
                    fit: BoxFit.cover, imageUrl: getThumbnailUrl()),
              ),
            );
          }

          return Hero(
            tag: widget.id,
            child: SizedBox(
              height: 300,
              width: double.infinity,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                placeholder: (BuildContext context, value) {
                  return CachedNetworkImage(
                      fit: BoxFit.cover,
                      height: 300,
                      imageUrl: getThumbnailUrl());
                },
                height: 300,
                imageUrl: assetImageList.items.first.href,
              ),
            ),
          );
        }),
        Positioned(
          top: 16,
          left: 16,
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }

  String getThumbnailUrl() {
    return 'https://images-assets.nasa.gov/image/${widget.id}/${widget.id}~thumb.jpg';
  }

  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });
    final response = await RepositoryProvider.of<DataRepository>(context)
        .getAssetImages(id: widget.id);
    if (response.code == 200) {
      assetImageList = response.data!;
    }
    setState(() {
      isLoading = false;
    });
  }
}