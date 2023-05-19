import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../helpers/helpers.dart';
import '../models/asset_model.dart';

class CarouselCardWidget extends StatelessWidget {
  final AssetModel asset;

  const CarouselCardWidget({
    super.key,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
          context, '/image-detail/${asset.data.first.nasaId}/${asset.data.first.mediaType}'),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 4,
        child: Stack(
          children: [
            Hero(
              tag: asset.data.first.nasaId,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(asset.links.first.href),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black87, Colors.transparent],
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Chip(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        label: Text(formatDate(asset.data.first.dateCreated),
                            style: const TextStyle(color: Colors.white)),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Chip(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          label: asset.data.first.mediaType == 'image'
                              ? const Icon(
                                  Icons.image,
                                  size: 20,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.videocam,
                                  size: 20,
                                  color: Colors.white,
                                ))
                    ],
                  ),
                  Text(
                    asset.data.first.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget loading de CarouselCardWidget
///
/// Este widget se utiliza para mostrar un loading mientras se carga la imagen
class CarouselCardWidgetLoading extends StatelessWidget {
  const CarouselCardWidgetLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 4,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
