import 'package:flutter/material.dart';

import '../widgets/image_detail_body_widget.dart';
import '../widgets/image_detail_header.dart';
import '../widgets/video_player_widget.dart';

class ImageDetailPage extends StatefulWidget {
  final String id;
  final String type;

  const ImageDetailPage({super.key, required this.id, required this.type});

  @override
  State<ImageDetailPage> createState() => _ImageDetailPageState();
}

class _ImageDetailPageState extends State<ImageDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (widget.type == "image")
            ImageDetailHeader(
              id: widget.id,
            ),
          if (widget.type == "video")
            VideoPlayerWidget(
              id: widget.id,
            ),
          Expanded(
            child: ImageDetailBodyWidget(
              type: widget.type,
              id: widget.id,
            ),
          ),
        ],
      ),
    );
  }
}
