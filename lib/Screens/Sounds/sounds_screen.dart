import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:insomnia_app/Constants/app_styles.dart';
import 'package:insomnia_app/Repository/sound_repository.dart';
import 'package:insomnia_app/Screens/Sounds/play_sound.dart';
import 'package:intl/intl.dart';

class SoundsScreen extends StatefulWidget {
  static const String routeName = 'Sounds-Screen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SoundsScreen(),
    );
  }

  const SoundsScreen({super.key});

  @override
  State<SoundsScreen> createState() => _SoundsScreenState();
}

class _SoundsScreenState extends State<SoundsScreen> {
  var timeNow = int.parse(
    DateFormat('kk').format(
      DateTime.now(),
    ),
  );
  String message = '';
  final SoundRepository soundRepository = SoundRepository();

  @override
  Widget build(BuildContext context) {
    if (timeNow <= 12) {
      message = 'Good Morning Dear!';
    } else if ((timeNow > 12) && timeNow <= 16) {
      message = "Good AfterNoon Dear!";
    } else if ((timeNow > 16) && (timeNow < 20)) {
      message = "Good Evening Dear!";
    } else {
      message = "Good Night Dear!";
    }
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 80.h,
                title: Text(
                  message,
                  style: AppStyles().headerTextStyle.copyWith(
                        color: AppStyles.onPrimary,
                      ),
                ),
                pinned: true,
                floating: true,
                bottom: TabBar(
                  unselectedLabelStyle: AppStyles().bodyTextStyle.copyWith(
                        color: AppStyles.onPrimary,
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,
                      ),
                  labelStyle: AppStyles().bodyTextStyle.copyWith(
                        color: AppStyles.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                  indicatorColor: AppStyles.primaryColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [
                    Tab(
                      text: "Meditation Sounds",
                    ),
                    Tab(
                      text: "Sleep Sounds",
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              // Meditation Sounds
              AnimationLimiter(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: soundRepository.meditationSounds.length,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child: SlideAnimation(
                        horizontalOffset: -50.0,
                        child: FadeInAnimation(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlaySoundBox(
                                    url: soundRepository
                                        .meditationSounds[index].soundUrl,
                                    name: soundRepository
                                        .meditationSounds[index].soundName,
                                    duration: soundRepository
                                        .meditationSounds[index].length,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 20.w,
                              ).copyWith(
                                bottom: 10.h,
                              ),
                              height: 100.h,
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  20.r,
                                ),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                    ),
                                    height: 60.h,
                                    width: 60.w,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppStyles.primaryColor,
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        soundRepository.meditationSounds[index]
                                                .isPlaying
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                        color: AppStyles.onPrimary,
                                      ),
                                      onPressed: () async {
                                        // setState(() {
                                        //   soundRepository.meditationSounds[index]
                                        //           .isPlaying =
                                        //       !soundRepository
                                        //           .meditationSounds[index]
                                        //           .isPlaying;
                                        // });
                                      },
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        soundRepository
                                            .meditationSounds[index].soundName,
                                        style: AppStyles()
                                            .headerTextStyle
                                            .copyWith(
                                              fontSize: 18.sp,
                                            ),
                                      ),
                                      Text(
                                        soundRepository
                                            .meditationSounds[index].length,
                                        style:
                                            AppStyles().bodyTextStyle.copyWith(
                                                  color: AppStyles.onPrimary,
                                                ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Sleep Sounds
              AnimationLimiter(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: soundRepository.sleepSounds.length,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child: SlideAnimation(
                        horizontalOffset: 50.0,
                        child: FadeInAnimation(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlaySoundBox(
                                    url: soundRepository
                                        .sleepSounds[index].soundUrl,
                                    name: soundRepository
                                        .sleepSounds[index].soundName,
                                    duration: soundRepository
                                        .sleepSounds[index].length,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 20.w,
                              ).copyWith(
                                bottom: 10.h,
                              ),
                              height: 100.h,
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  20.r,
                                ),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                    ),
                                    height: 60.h,
                                    width: 60.w,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppStyles.primaryColor,
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        soundRepository
                                                .sleepSounds[index].isPlaying
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                        color: AppStyles.onPrimary,
                                      ),
                                      onPressed: () async {
                                        // setState(() {
                                        //   soundRepository
                                        //           .sleepSounds[index].isPlaying =
                                        //       !soundRepository
                                        //           .sleepSounds[index].isPlaying;
                                        // });
                                      },
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        soundRepository
                                            .sleepSounds[index].soundName,
                                        style: AppStyles()
                                            .headerTextStyle
                                            .copyWith(
                                              fontSize: 18.sp,
                                            ),
                                      ),
                                      Text(
                                        soundRepository
                                            .sleepSounds[index].length,
                                        style:
                                            AppStyles().bodyTextStyle.copyWith(
                                                  color: AppStyles.onPrimary,
                                                ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
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
