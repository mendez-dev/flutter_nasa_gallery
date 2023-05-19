import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_app/src/models/asset_metadata_model.dart';
import 'package:nasa_app/src/models/asset_metadata_response.dart';
import 'package:nasa_app/src/repositories/data_repository/data_repository.dart';
import 'package:shimmer/shimmer.dart';

class ImageDetailBodyWidget extends StatefulWidget {
  final String id;
  final String type;

  const ImageDetailBodyWidget({
    required this.id,
    super.key,
    required this.type,
  });

  @override
  State<ImageDetailBodyWidget> createState() => _ImageDetailBodyWidgetState();
}

class _ImageDetailBodyWidgetState extends State<ImageDetailBodyWidget> {
  bool isLoading = false;

  late AssetMetadataModel assetMetadata;

  @override
  void initState() {
    getMetadata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _ImageDetailBodyLoading();
    }

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Chip(
              backgroundColor: Theme.of(context).colorScheme.primary,
              label: Text(
                assetMetadata.dateCreated,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.white),
              ),
            ),

            const SizedBox(height: 16),
            Text(
              assetMetadata.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              assetMetadata.description ?? '',
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 16),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: const Icon(
                    Icons.photo_camera,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Photographer',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      assetMetadata.photographer ?? 'Unknown',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
            // Location info
            const SizedBox(height: 16),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Location',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      assetMetadata.location ?? 'Unknown',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getMetadata() async {
    setState(() {
      isLoading = true;
    });
    final AssetMetadataResponse response =
        await RepositoryProvider.of<DataRepository>(context)
            .getAssetMetadata(id: widget.id, type: widget.type);

    if (response.code == 200) {
      setState(() {
        assetMetadata = response.data!;
      });
    }

    setState(() {
      isLoading = false;
    });
  }
}

class _ImageDetailBodyLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Chip(
                backgroundColor: Colors.grey[300],
                label: Container(
                  width: 100,
                  height: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 120,
                color: Colors.white,
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 80,
                color: Colors.white,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    radius: 20,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120,
                        height: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 4),
                      Container(
                        width: 80,
                        height: 16,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    radius: 20,
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        height: 16,
                        color: Colors.white,
                      ),
                      SizedBox(height: 4),
                      Container(
                        width: 120,
                        height: 16,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
