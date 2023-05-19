import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../repositories/data_repository/data_repository.dart';
import '../utils/logger.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String id;

  const VideoPlayerWidget({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  VideoPlayerWidgetState createState() => VideoPlayerWidgetState();
}

class VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  bool isLoading = false;
  bool isError = false;
  late VideoPlayerController _controller;
  bool isPlaying = false;
  double videoProgress = 0.0;
  Timer? _timer;

  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    // Verificamos si el controlador esta inicializado
    if (_controller.value.isInitialized) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Stack(
        children: [
          const SizedBox(
            width: double.infinity,
            height: 300,
            child: Center(child: CircularProgressIndicator()),
          ),
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

    if (isError) {
      return Stack(
        children: [
          const SizedBox(
            width: double.infinity,
            height: 300,
            child: Center(child: Text('unsupported video')),
          ),
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

    return Stack(
      children: [
        Column(
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
            VideoControls(
              isPlaying: isPlaying,
              videoProgress: videoProgress,
              onPlayPausePressed: () {
                setState(() {
                  if (isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                  }
                  isPlaying = !isPlaying;
                });
              },
              controller: _controller,
            ),
          ],
        ),
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

  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });
    final response = await RepositoryProvider.of<DataRepository>(context)
        .getVideos(id: widget.id);

    if (response.code == 200) {
      // Verificamos que la primer respuesta sea un enlace de video mp4 o webm
      if (!response.data.first.contains('.mp4') &&
          !response.data.first.contains('.webm')) {
        logger.e('El video no es compatible');
        _controller = VideoPlayerController.network('');
        setState(() {
          isError = true;
          isLoading = false;
        });
        return;
      }
      // Verificamos si el url es https sino lo convertimos
      String url = response.data.first;
      if (!response.data.first.contains('https')) {
        url = response.data.first.replaceFirst('http', 'https');
      }
      _controller = VideoPlayerController.network(url);
      await _controller.initialize();

      // Creamos el timer para actualizar el progreso del video
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (_controller.value.isPlaying) {
          setState(() {
            videoProgress =
                _controller.value.position.inMilliseconds.toDouble();
          });
        }
      });

      setState(() {
        isLoading = false;
      });
    }
  }
}

class VideoControls extends StatelessWidget {
  final bool isPlaying;
  final double videoProgress;
  final VoidCallback onPlayPausePressed;
  final VideoPlayerController controller;

  const VideoControls({
    Key? key,
    required this.isPlaying,
    required this.videoProgress,
    required this.onPlayPausePressed,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      color: theme.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
              size: 50,
            ),
            onPressed: onPlayPausePressed,
          ),
          Text(
            formatDuration(Duration(milliseconds: videoProgress.toInt())),
            style: const TextStyle(color: Colors.white),
          ),
          Expanded(
            child: VideoProgressIndicator(
              controller,
              allowScrubbing: true,
              padding: const EdgeInsets.all(10),
              colors: VideoProgressColors(
                playedColor: Colors.red,
                bufferedColor: Colors.grey,
                backgroundColor: Colors.white.withOpacity(0.5),
              ),
            ),
          ),
          Text(
            formatDuration(controller.value.duration),
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
