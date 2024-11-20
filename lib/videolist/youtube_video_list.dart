import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtubeclonecording/screens/video_screen.dart';

import '../api/youtube_data_api.dart';

class YoutubeVideoList extends StatefulWidget {
  const YoutubeVideoList({super.key});

  @override
  State<YoutubeVideoList> createState() => _YoutubeVideoListState();
}

class _YoutubeVideoListState extends State<YoutubeVideoList> {

  final YoutubeService _youtubeService = YoutubeService();
  List<dynamic> _videos = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchVideos();
  }

  void _fetchVideos() async {
    try {
      final videos = await _youtubeService.fetchVideoList();
      setState(() {
        _videos = videos;
        _isLoading = false;
      });
    } catch (e) {
      print("Error: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding : EdgeInsets.symmetric(vertical: 10),
      child: _isLoading
          ? const Expanded(child: Center(child: CircularProgressIndicator()))
          : Expanded(
        child: ListView.builder(
          itemCount: _videos.length,
          itemBuilder: (context, index) {
            final video = _videos[index];
            final title = video['snippet']['title'];
            final thumbnailUrl = video['snippet']['thumbnails']['high']['url'];
            final uploader = video['snippet']['channelTitle'];
            return InkWell(
              onTap:() {
                Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) =>
                        VideoScreen(
                          videoId: video['id'],
                          videoTitle: title,
                          videoUploader: uploader,
                        )
                )
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    thumbnailUrl,
                    width: double.infinity,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 8),
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
                  Text(uploader, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
