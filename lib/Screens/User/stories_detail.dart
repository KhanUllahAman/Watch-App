// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insomnia_app/Constants/app_styles.dart';

class StoriesDetail extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  const StoriesDetail({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: AppStyles().headerTextStyle,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        physics: const BouncingScrollPhysics(),
        children: [
          Image.asset(
            imageUrl,
            height: 400.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            description,
            style: AppStyles().bodyTextStyle,
          )
        ],
      ),
    );
  }
}
