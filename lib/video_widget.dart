import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewWidget extends StatefulWidget {
  final String videoPath;
  final bool isAsset;

  VideoPreviewWidget({required this.videoPath, this.isAsset = false});

  @override
  _VideoPreviewWidgetState createState() => _VideoPreviewWidgetState();
}

class _VideoPreviewWidgetState extends State<VideoPreviewWidget> {
  late VideoPlayerController _controller;
  bool _showPlayIcon = true;

  @override
  void initState() {
    super.initState();
    _controller = widget.isAsset
        ? VideoPlayerController.asset(widget.videoPath)
        : VideoPlayerController.network(widget.videoPath);
    _controller.initialize().then((_) => setState(() {}));
    _controller.setLooping(true);

    _controller.addListener(() {
      if (_controller.value.isPlaying) {
        setState(() {
          _showPlayIcon = false;
        });
      } else {
        setState(() {
          _showPlayIcon = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.value.isPlaying) {
          _controller.pause();
        } else {
          _controller.play();
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 210.0,
            child: _controller.value.isInitialized
                ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
                : Container(color: Colors.black),
          ),
          if (_showPlayIcon)
            Icon(Icons.play_circle_fill, color: Colors.white, size: 80),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
