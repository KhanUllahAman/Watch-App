import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insomnia_app/Constants/app_styles.dart';
import 'package:insomnia_app/Repository/tips_repository.dart';

class Tips extends StatelessWidget {
  static const String routeName = 'Tips-Screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const Tips(),
    );
  }

  const Tips({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tips",
          style: AppStyles().headerTextStyle,
        ),
      ),
      body: SafeArea(
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              itemCount: TipsRepository().tips.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    border: Border.all(
                      color: AppStyles.onPrimary,
                      width: 1.h,
                    ),
                    borderRadius: BorderRadius.circular(
                      20.r,
                    ),
                  ),
                  margin: EdgeInsets.only(
                    bottom: 20.h,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 15.h,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${TipsRepository().tips[index].title} $index",
                            style: AppStyles().headerTextStyle.copyWith(
                                  fontSize: 18.sp,
                                ),
                          ),
                          Icon(
                            Icons.tips_and_updates,
                            color: AppStyles.primaryColor,
                            size: 30.sp,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        TipsRepository().tips[index].description,
                        style: AppStyles().bodyTextStyle.copyWith(
                              fontSize: 14.sp,
                            ),
                      ),
                    ],
                  ),
                );
              })),
    );
  }
}
