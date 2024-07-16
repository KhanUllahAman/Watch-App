import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static const imagebaseUrl = "assets/images";
  static const iconsbaseUrl = "assets/icons";
  static const animationbaseUrl = "assets/animations";
  static const soundsbaseUrl = "sounds";
  static const fontsbaseUrl = "assets/fonts";

  // Color Pallete
  static const onPrimary = Color(0xff6c6876);
  static const whiteColor = Colors.white;
  static const brandyRose = Color(0xffB5838e);
  static const tonysPink = Color(0xffE4989b);
  static const primaryColor = Color(0xffFfb4a1);
  static const romanticColor = Color(0xffFfcdb2);

  // Image Assets
  static const splashImage = "$imagebaseUrl/splash.png";
  static const onboardingImage = "$imagebaseUrl/welcome.png";
  static const mainLogo = "$imagebaseUrl/logo.png";
  static const frame = "$imagebaseUrl/Frame.png";
  static const backFrame = "$imagebaseUrl/back_frame.png";
  static const placeholder = "$imagebaseUrl/placeholder.png";
  static const userPlaceholder = "$imagebaseUrl/user.png";
  static const bedroomTemperature = "$imagebaseUrl/bedroom_temperature.png";
  static const chamomile = "$imagebaseUrl/chamomile.png";
  static const dua_1 = "$imagebaseUrl/dua_1.jpg";
  static const dua_2 = "$imagebaseUrl/dua_2.jpg";
  static const dua_3 = "$imagebaseUrl/dua_3.png";
  static const dua_4 = "$imagebaseUrl/dua_4.png";
  static const exercise = "$imagebaseUrl/exercise.png";
  static const lavenderoil = "$imagebaseUrl/lavender_oil.png";
  static const melatonin = "$imagebaseUrl/melatonin.png";
  static const naturalLight = "$imagebaseUrl/natural_light.png";
  static const passionFlower = "$imagebaseUrl/passion_flower.png";
  static const relaxation = "$imagebaseUrl/relaxation.png";
  static const setASchedule = "$imagebaseUrl/set_a_schedule.png";
  static const stimulants = "$imagebaseUrl/stimulants.png";
  static const doctorImage = "$imagebaseUrl/doctor.jpg";

  // Icon Assets
  static const facebook = "$iconsbaseUrl/facebook.png";
  static const google = "$iconsbaseUrl/google.png";
  static const music = "$iconsbaseUrl/music.png";

  // Animation Assets
  static const loadingAnimation = "$animationbaseUrl/loading.json";
  static const empty = "$animationbaseUrl/empty.json";
  static const delete = "$animationbaseUrl/delete.json";

  // Sound Assets
  static const sound1 = "$soundsbaseUrl/1.mp3";
  static const sound2 = "$soundsbaseUrl/2.mp3";
  static const sound3 = "$soundsbaseUrl/3.mp3";
  static const sound4 = "$soundsbaseUrl/4.mp3";
  static const sound5 = "$soundsbaseUrl/5.mp3";
  static const sound6 = "$soundsbaseUrl/6.mp3";

  // Stories
  static const story1 = "$imagebaseUrl/story-1.png";
  static const story2 = "$imagebaseUrl/story-2.png";
  static const story3 = "$imagebaseUrl/story-3.jpg";
  static const story4 = "$imagebaseUrl/story-4.png";
  static const story5 = "$imagebaseUrl/story-5.png";

  // Text Styles for App
  final headerTextStyle = TextStyle(
    fontFamily: "Helvetica",
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppStyles.onPrimary,
  );

  final bodyTextStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
  );
}
