import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtubeclonecording/category_list_widget/category_list.dart';
import 'package:youtubeclonecording/widgets/myprofile.dart';
import 'package:youtubeclonecording/widgets/top_button.dart';
import 'package:youtubeclonecording/screens/sharing_screen.dart';
import 'package:youtubeclonecording/screens/alarm_screen.dart';
import 'package:youtubeclonecording/myprofile_widgets/myprofile_screen.dart';
import 'package:youtubeclonecording/screens/search_screen.dart';
import 'package:youtubeclonecording/category_list_widget/category_button.dart';

import 'api/youtube_data_api.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white ,
        appBar: PreferredSize(
          preferredSize: const Size(1000, 100),
          child: Padding(
            padding: const EdgeInsets.only(top: 50,left: 10,right: 10),
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          flex: 2,
                          child: Image.asset('assets/images/youtubelogo.png')
                      ),
                      const Flexible(
                          flex: 1,
                          child: SizedBox(),
                      ),
                      const TopButton(icon: Icons.screen_share,widget: SharingScreen()),
                      const TopButton(icon: CupertinoIcons.alarm,widget: AlarmScreen()),
                      const TopButton(icon: CupertinoIcons.search,widget: SearchScreen(),),
                      const Flexible(
                        flex: 1,
                        child: Myprofile(size: 32,),
                      )
                    ],
                  ),
                ),
                const Flexible(
                    flex: 1,
                    child: CategoryList()
                ),
              ],
            ),
          ),
        ),
        body: Scrollbar(
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                  itemCount: _videos.length,
                  itemBuilder: (context, index) {
                    final video = _videos[index];
                    final title = video['snippet']['title'];
                    final description = video['snippet']['description'];
                    final thumbnailUrl = video['snippet']['thumbnails']['default']['url'];
                    final uploader = video['snippet']['channelTitle'];
                    return ListTile(
                      leading: Image.network(thumbnailUrl),
                      title: Text(title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Uploader: $uploader'),
                          SizedBox(height: 4),
                          Text('Description: $description'),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
