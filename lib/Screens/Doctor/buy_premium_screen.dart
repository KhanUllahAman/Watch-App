import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Constants/app_styles.dart';
import '../../Widgets/custom_elevated_button.dart';
import '../../Widgets/custom_snackbar.dart';

class BuyPremiumScreen extends StatefulWidget {
  final PageController controller;
  const BuyPremiumScreen({super.key, required this.controller});

  @override
  State<BuyPremiumScreen> createState() => _BuyPremiumScreenState();
}

class _BuyPremiumScreenState extends State<BuyPremiumScreen> {
  bool isMonthlySelected = false;
  bool isYearlySelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 120.h,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                height: 550.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      AppStyles.doctorImage,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 350.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        20.r,
                      ),
                      topRight: Radius.circular(
                        20.r,
                      ),
                    ),
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isYearlySelected == false) {
                                isMonthlySelected = !isMonthlySelected;
                              }
                            });
                          },
                          child: Container(
                            height: 80.h,
                            width: 350.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20.r,
                              ),
                              color: Colors.white,
                              border: isMonthlySelected
                                  ? Border.all(
                                      width: 5.w, color: AppStyles.primaryColor)
                                  : Border.all(
                                      width: 0, color: Colors.transparent),
                              boxShadow: isMonthlySelected
                                  ? null
                                  : [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 5,
                                        offset: const Offset(
                                            1, 1), // changes position of shadow
                                      ),
                                    ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "1 Month",
                                    style: AppStyles().headerTextStyle.copyWith(
                                          color: AppStyles.primaryColor,
                                          fontSize: 18.sp,
                                        ),
                                  ),
                                  Text(
                                    "12\$/mo",
                                    style: AppStyles().headerTextStyle.copyWith(
                                          color: AppStyles.primaryColor,
                                          fontSize: 18.sp,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isMonthlySelected == false) {
                                isYearlySelected = !isYearlySelected;
                              }
                            });
                          },
                          child: Container(
                            height: 80.h,
                            width: 350.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20.r,
                              ),
                              color: Colors.white,
                              border: isYearlySelected
                                  ? Border.all(
                                      width: 5.w, color: AppStyles.primaryColor)
                                  : Border.all(
                                      width: 0, color: Colors.transparent),
                              boxShadow: isYearlySelected
                                  ? null
                                  : [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 5,
                                        offset: const Offset(
                                            1, 1), // changes position of shadow
                                      ),
                                    ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "1 Year",
                                    style: AppStyles().headerTextStyle.copyWith(
                                          color: AppStyles.primaryColor,
                                          fontSize: 18.sp,
                                        ),
                                  ),
                                  Text(
                                    "109.99\$/yr",
                                    style: AppStyles().headerTextStyle.copyWith(
                                          color: AppStyles.primaryColor,
                                          fontSize: 18.sp,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Buy Now, Cancel Anytime!",
                          style: AppStyles().bodyTextStyle.copyWith(
                                fontSize: 20.h,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomElevatedButton(
                            onTap: () {
                              if (isMonthlySelected || isYearlySelected) {
                                widget.controller.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut);
                              } else {
                                showSnackbar(context, Colors.red,
                                    "Please Choose a Plan");
                              }
                            },
                            buttonName: "Continue"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
