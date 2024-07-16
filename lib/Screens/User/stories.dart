import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insomnia_app/Constants/app_styles.dart';
import 'package:insomnia_app/Repository/stories_repository.dart';
import 'package:insomnia_app/Screens/User/stories_detail.dart';

class StoriesScreen extends StatelessWidget {
  static const String routeName = 'Stories-Screen';
  final StoriesRepository storiesRepository = StoriesRepository();

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => StoriesScreen(),
    );
  }

  StoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BedTime Stories",
          style: AppStyles().headerTextStyle,
        ),
      ),
      body: SafeArea(
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
              itemCount: storiesRepository.stories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoriesDetail(
                              imageUrl:
                                  StoriesRepository().stories[index].imageUrl,
                              title: StoriesRepository().stories[index].title,
                              description: StoriesRepository()
                                  .stories[index]
                                  .description),
                        ),
                      );
                    },
                    leading: Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            StoriesRepository().stories[index].imageUrl,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      StoriesRepository().stories[index].title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles().headerTextStyle.copyWith(
                            fontSize: 14.sp,
                          ),
                    ),
                    subtitle: Text(
                      StoriesRepository().stories[index].description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles().bodyTextStyle,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 18.sp,
                      color: AppStyles.onPrimary,
                    ),
                  ),
                );
              })),
    );
  }
}
