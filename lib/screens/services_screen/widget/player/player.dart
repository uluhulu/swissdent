import 'package:flutter/material.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:video_player/video_player.dart';

///video player for services
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=169%3A279
class Player extends StatefulWidget {
  ///controller for video player
  final VideoPlayerController videoPlayerController;

  const Player({Key key, this.videoPlayerController}) : super(key: key);

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        handlePlayer();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildPlayer(),
          _buildPlayerButton(),
        ],
      ),
    );
  }

  Widget _buildPlayer() {
    return widget.videoPlayerController.value.initialized
        ? AspectRatio(
          aspectRatio: widget.videoPlayerController.value.aspectRatio,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: VideoPlayer(widget.videoPlayerController)),
        )
        : Container();
  }

  Widget _buildPlayerButton() {
    if (!widget.videoPlayerController.value.isPlaying) {
      return Image.asset(
        iconPlayerButton,
        width: 42,
      );
    }

    return SizedBox();
  }

  void handlePlayer() {
    setState(() {
      // If the video is playing, pause it.
      if (widget.videoPlayerController.value.isPlaying) {
        widget.videoPlayerController.pause();
      } else {
        // If the video is paused, play it.
        widget.videoPlayerController.play();
      }
    });
  }
}
