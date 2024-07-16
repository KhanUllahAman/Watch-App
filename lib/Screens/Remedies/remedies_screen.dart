// ignore_for_file: use_super_parameters, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insomnia_app/Constants/app_styles.dart';
import 'package:insomnia_app/Models/remedies_model.dart';
import 'package:insomnia_app/Repository/remedies_repository.dart';
import 'package:insomnia_app/Screens/Remedies/remedies_detail_screen.dart';
import 'package:remixicon/remixicon.dart';

class RemediesScreen extends StatefulWidget {
  static const String routeName = 'Remedies-Screen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const RemediesScreen(),
    );
  }

  const RemediesScreen({Key? key}) : super(key: key);

  @override
  _RemediesScreenState createState() => _RemediesScreenState();
}

class _RemediesScreenState extends State<RemediesScreen> {
  /// Categories keys
  final List<GlobalKey> remedyCategories = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  /// Scroll Controller
  late ScrollController scrollController;

  /// Tab Context
  BuildContext? tabContext;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(animateToTab);

    super.initState();
  }

  /// Animate To Tab
  void animateToTab() {
    late RenderBox box;

    for (var i = 0; i < remedyCategories.length; i++) {
      box = remedyCategories[i].currentContext!.findRenderObject() as RenderBox;
      Offset position = box.localToGlobal(Offset.zero);

      if (scrollController.offset >= position.dy) {
        DefaultTabController.of(tabContext!).animateTo(
          i,
          duration: const Duration(milliseconds: 100),
        );
      }
    }
  }

  /// Scroll to Index
  void scrollToIndex(int index) async {
    scrollController.removeListener(animateToTab);
    final categories = remedyCategories[index].currentContext!;
    await Scrollable.ensureVisible(
      categories,
      duration: const Duration(milliseconds: 600),
    );
    scrollController.addListener(animateToTab);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Builder(
        builder: (BuildContext context) {
          tabContext = context;
          return Scaffold(
            appBar: _buildAppBar(),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              child: Column(
                children: [
                  /// Earnings Title - Content
                  _buildCategoryTitle('Lifestyle Changes', 0),
                  _buildItemList(RemediesRepository.lifestyleChanges),

                  /// Ring Title - Content
                  _buildCategoryTitle('Herbal Remedies', 1),
                  _buildItemList(RemediesRepository.herbalRemedies),

                  /// Ring Title - Content
                  _buildCategoryTitle('Quranic Remedies', 2),
                  _buildItemList(RemediesRepository.quranicRemedies),

                  /// Empty Bottom space
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// AppBar
  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 80.h,
      title: Text(
        'All Remedies',
        style: AppStyles().headerTextStyle,
      ),
      bottom: TabBar(
        unselectedLabelStyle: AppStyles().bodyTextStyle.copyWith(
              color: AppStyles.onPrimary,
              fontWeight: FontWeight.normal,
              fontSize: 12.sp,
            ),
        labelStyle: AppStyles().bodyTextStyle.copyWith(
              color: AppStyles.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
        indicatorColor: AppStyles.primaryColor,
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: const [
          Tab(child: Text('Lifestyle Changes')),
          Tab(child: Text('Herbal Remedies')),
          Tab(child: Text('Quranic Remedies')),
        ],
        onTap: (int index) => scrollToIndex(index),
      ),
    );
  }

  /// Item Lists
  Widget _buildItemList(List<RemediesModel> categories) {
    return Column(
      children: categories.map((m3) => _buildSingleItem(m3)).toList(),
    );
  }

  /// Single Product item widget
  Widget _buildSingleItem(RemediesModel item) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RemediesDetailScreen(item: item),
          ),
        );
      },
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 160,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      item.imageUrl,
                      fit: BoxFit.cover,
                      height: 150.h,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.remedyName,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: AppStyles().headerTextStyle.copyWith(
                                  fontSize: 18.sp,
                                  color: AppStyles.onPrimary,
                                ),
                          ),
                          Text(
                            item.remedyDescription,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles().bodyTextStyle.copyWith(
                                  color: AppStyles.onPrimary,
                                  fontSize: 14.sp,
                                ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("",
                                      style:
                                          AppStyles().headerTextStyle.copyWith(
                                                fontSize: 14.sp,
                                                color: AppStyles.onPrimary,
                                              )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          RemediesDetailScreen(item: item),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Remix.arrow_right_s_line,
                                  color: AppStyles.onPrimary,
                                  size: 24.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  /// Category Title
  Widget _buildCategoryTitle(String title, int index) {
    return Padding(
      key: remedyCategories[index],
      padding: const EdgeInsets.only(top: 14, right: 12, left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyles().headerTextStyle.copyWith(
                      fontSize: 20.sp,
                      color: AppStyles.onPrimary,
                    ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
