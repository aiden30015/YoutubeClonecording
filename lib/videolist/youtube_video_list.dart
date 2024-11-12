import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return _isLoading
        ? const Expanded(child: Center(child: CircularProgressIndicator()))
        : Expanded(
      child: ListView.builder(
        itemCount: _videos.length,
        itemBuilder: (context, index) {
          final video = _videos[index];
          final title = video['snippet']['title'];
          final thumbnailUrl = video['snippet']['thumbnails']['high']['url'];
          final uploader = video['snippet']['channelTitle'];
          return ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero
                ),
              ),
              side: MaterialStateProperty.all(
                BorderSide.none,
              ),
              backgroundColor: MaterialStateProperty.all(
                Colors.white
              ),
              padding: MaterialStateProperty.all(
                EdgeInsets.all(8.0),
              )
            ),
            onPressed: (){},
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
    );
  }
}
