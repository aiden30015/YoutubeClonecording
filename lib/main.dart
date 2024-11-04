import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtubeclonecording/widgets/myprofile.dart';
import 'package:youtubeclonecording/widgets/top_button.dart';
import 'package:youtubeclonecording/screens/sharing_screen.dart';
import 'package:youtubeclonecording/screens/alarm_screen.dart';
import 'package:youtubeclonecording/screens/myprofile_screen.dart';
import 'package:youtubeclonecording/screens/search_screen.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white ,
        appBar: PreferredSize(
          preferredSize: Size(200, 50),
          child: Padding(
            padding: const EdgeInsets.only(top: 50,left: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    flex: 2,
                    child: Image.asset('assets/images/youtubelogo.png')
                ),
                Flexible(
                    flex: 1,
                    child: SizedBox(),
                ),
                TopButton(icon: Icons.screen_share,widget: SharingScreen()),
                TopButton(icon: CupertinoIcons.alarm,widget: AlarmScreen()),
                TopButton(icon: CupertinoIcons.search,widget: SearchScreen(),),
                Flexible(
                  flex: 1,
                  child: Myprofile(size: 32,),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
