import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../helpers/helpers.dart';
import '../models/asset_model.dart';

class RecentItemWidget extends StatelessWidget {
  final AssetModel asset;

  const RecentItemWidget({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context,
          '/image-detail/${asset.data.first.nasaId}/${asset.data.first.mediaType}'),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Hero(
                  tag: asset.data.first.nasaId,
                  child: CachedNetworkImage(
                    imageUrl: asset.links.first.href,
                    fit: BoxFit.cover,
                    placeholder: (context, url) {
                      // Shimmer effect
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: 70,
                          height: 70,
                          color: Colors.red[300],
                        ),
                      );
                    },
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    asset.data.first.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(
                    children: [
                      _getIcon(mediaType: asset.data.first.mediaType),
                      Text(
                        formatDate(asset.data.first.dateCreated),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getIcon({required String mediaType}) {
    switch (mediaType) {
      case 'image':
        return Container(
            margin: const EdgeInsets.only(right: 4),
            child: const Icon(Icons.image, size: 16));
      case 'video':
        return Container(
            margin: const EdgeInsets.only(right: 4),
            child: const Icon(Icons.videocam, size: 16));
      case 'audio':
        return Container(
            margin: const EdgeInsets.only(right: 4),
            child: const Icon(Icons.audiotrack, size: 16));
      default:
        return Container(
            margin: const EdgeInsets.only(right: 4),
            child: const Icon(Icons.insert_drive_file, size: 16));
    }
  }
}

/// Widget loanding de RecentItemWidget
///
/// Este widget se utiliza para mostrar un widget de carga mientras se obtienen los datos de la API
class RecentItemWidgetLoading extends StatelessWidget {
  const RecentItemWidgetLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.red[300],
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 16,
                    color: Colors.red[300],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 100,
                    height: 16,
                    color: Colors.red[300],
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
