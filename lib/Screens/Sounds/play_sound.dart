// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters, must_be_immutable
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Constants/app_styles.dart';

class PlaySoundBox extends StatefulWidget {
  String url;
  String name;
  String duration;

  PlaySoundBox({
    super.key,
    required this.url,
    required this.name,
    required this.duration,
  });

  @override
  State<PlaySoundBox> createState() => _PlaySoundBoxState();
}

class _PlaySoundBoxState extends State<PlaySoundBox> {
  // Insert your music URL
  String thumbnailImgUrl = ""; // Insert your thumbnail URL
  var player = AudioPlayer();
  bool loaded = false;
  bool playing = false;

  void loadMusic() async {
    await player.setSource(AssetSource(widget.url));
    setState(() {
      loaded = true;
    });
  }

  void playMusic() async {
    setState(() {
      playing = true;
    });
    await player.play(
      AssetSource(widget.url),
    );
  }

  void pauseMusic() async {
    setState(() {
      playing = false;
    });
    await player.pause();
  }

  @override
  void initState() {
    loadMusic();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
          style: AppStyles().headerTextStyle.copyWith(
                color: AppStyles.onPrimary,
              ),
        ),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 400.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 20.w,
            ).copyWith(
              top: 20.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20.r,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.white,
              image: const DecorationImage(
                scale: 1.5,
                image: AssetImage(
                  AppStyles.music,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            padding: EdgeInsets.all(
              5.h,
            ),
            decoration: const BoxDecoration(
                color: AppStyles.primaryColor, shape: BoxShape.circle),
            child: IconButton(
              icon: Icon(
                playing ? Icons.pause : Icons.play_arrow,
                size: 50.sp,
              ),
              onPressed: () {
                playing ? pauseMusic() : playMusic();
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 20.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Duration",
                  style: AppStyles().headerTextStyle.copyWith(
                        color: AppStyles.onPrimary,
                        fontSize: 18.sp,
                      ),
                ),
                Text(
                  "${widget.duration} minutes",
                ),
              ],
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Go Back",
              style: AppStyles().headerTextStyle.copyWith(
                    color: AppStyles.primaryColor,
                    fontSize: 18.sp,
                  ),
            ),
          ),
        ],
      )),
    );
  }
}
