import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key, required this.videoId});
  final String videoId;

  @override
  Widget build(BuildContext context) {
    final YoutubePlayerController _controller = YoutubePlayerController(initialVideoId: videoId);

    return MaterialApp(
      home: Scaffold(
        body: YoutubePlayer(
            controller: _controller,
          showVideoProgressIndicator: true,
          onReady: (){
              debugPrint("Player is ready.");
          }
        ),
      ),
    );
  }
}
