import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insomnia_app/Constants/app_styles.dart';
import 'package:insomnia_app/Services/helper_service.dart';
import 'package:insomnia_app/Widgets/custom_elevated_button.dart';
import 'package:insomnia_app/Widgets/custom_nav_bar.dart';

import '../../Widgets/dropdown_selector.dart';
import '../../controllers/survery_controller.dart';

class SurveyForm extends StatefulWidget {
  static const String routeName = 'Survey-Form-Screen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SurveyForm(),
    );
  }

  const SurveyForm({super.key});

  @override
  State<SurveyForm> createState() => _SurveyFormState();
}

class _SurveyFormState extends State<SurveyForm> {
  HelperService helperService = HelperService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 60.h,
        ),
        children: [
          Text(
            "Survey Form",
            style: AppStyles().headerTextStyle,
          ),
          ChoiceChips(),
          CustomElevatedButton(
            onTap: () {
              if (Get.find<UserController>().isAllQuestionsAnswered()) {
                int result = 17;
                if (result >= 0 && result <= 7) {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          "Report",
                          style: AppStyles().headerTextStyle,
                        ),
                        content: Text(
                          "Based on your responses, the severity level of your insomnia\nyou have No Clinically \nSignificant Insomnia \n(You're sleeping fine, no worries.)",
                          style: AppStyles().bodyTextStyle,
                        ),
                        actions: [
                          TextButton(
                            child: Text(
                              "Close",
                              style: AppStyles().headerTextStyle.copyWith(
                                    color: AppStyles.primaryColor,
                                    fontSize: 14.sp,
                                  ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                CustomNavBar.routeName,
                              );
                              HelperService.saveSurveyStatus(true);
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else if (result >= 8 && result <= 14) {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          "Report",
                          style: AppStyles().headerTextStyle,
                        ),
                        content: Text(
                          "Based on your responses, the severity level of your insomnia is\nClinical Insomnia (You're having a hard time sleeping, making your days harder too.)\nWe suggest you try our features like Meditation and Sleep sounds,Sleep tracking, and others ",
                          style: AppStyles().bodyTextStyle,
                        ),
                        actions: [
                          TextButton(
                            child: Text(
                              "Close",
                              style: AppStyles().headerTextStyle.copyWith(
                                    color: AppStyles.primaryColor,
                                    fontSize: 14.sp,
                                  ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                CustomNavBar.routeName,
                              );
                              HelperService.saveSurveyStatus(true);
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else if (result >= 15 && result <= 21) {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          "Report",
                          style: AppStyles().headerTextStyle,
                        ),
                        content: Text(
                          "Based on your responses, the severity level of your insomnia\nSubthreshold Insomnia (Sometimes you struggle a bit with sleep, but it's manageable.)We suggest you try our features like Meditation and Sleep sounds, Sleep tracking, and others ",
                          style: AppStyles().bodyTextStyle,
                        ),
                        actions: [
                          TextButton(
                            child: Text(
                              "Close",
                              style: AppStyles().headerTextStyle.copyWith(
                                    color: AppStyles.primaryColor,
                                    fontSize: 14.sp,
                                  ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                CustomNavBar.routeName,
                              );
                              HelperService.saveSurveyStatus(true);
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else if (result >= 22) {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          "Report",
                          style: AppStyles().headerTextStyle,
                        ),
                        content: Text(
                          "Based on your responses, the severity level of your insomnia is Severe Clinical Insomnia (Sometimes you struggle a bit with sleep, but it's manageable.)We suggest you try our features like Meditation and Sleep sounds, Sleep tracking, doctor Consultation Highly recommended, and others",
                          style: AppStyles().bodyTextStyle,
                        ),
                        actions: [
                          TextButton(
                            child: Text(
                              "Close",
                              style: AppStyles().headerTextStyle.copyWith(
                                    color: AppStyles.primaryColor,
                                    fontSize: 14.sp,
                                  ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                CustomNavBar.routeName,
                              );
                              HelperService.saveSurveyStatus(true);
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
                // Navigator.pushReplacementNamed(
                //   context,
                //   CustomNavBar.routeName,
                // );
              } else {
                Get.snackbar('Alert', 'Answer all Questions',
                    backgroundColor: Colors.red, colorText: Colors.white);
                return;
              }
            },
            buttonName: "Submit Form",
          )
        ],
      ),
    );
  }
}

class ChoiceChips extends StatelessWidget {
  ChoiceChips({super.key});
  final UserController _userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (Map element in _userController.questionsData)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(element["question"],
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      DropDownSelector(
                        options: List<String>.from(element["choices"]),
                        onOptionChanged: (selection) {
                          if (selection.isEmpty) {
                            _userController.removeAnswer(element["label"]);
                          } else {
                            _userController.addAnswer(
                                element["label"], selection);
                          }
                        },
                        key: Key(element["label"]),
                        selectedOption: element["answer"] ?? "",
                      )

                      // for (String chipLabel in element["choices"])
                      //   MyChip(
                      //     chipLabel: chipLabel,
                      //     selected: chipLabel == element["answer"],
                      //     toggleChipSelection: (isSelected) {
                      //       if (isSelected) {
                      //         _userController.addAnswer(
                      //             element["label"], chipLabel);
                      //       } else {
                      //         _userController.removeAnswer(element["label"]);
                      //       }
                      //     },
                      //   ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              )
          ],
        ),
      ),
    );
  }
}

class MyChip extends StatelessWidget {
  final String chipLabel;
  final bool selected;
  final Function toggleChipSelection;
  const MyChip(
      {super.key,
      required this.chipLabel,
      this.selected = false,
      required this.toggleChipSelection});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(
        chipLabel,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: selected ? Colors.white : Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.bold),
      ),
      selected: selected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      side: BorderSide(
        color: selected ? Colors.transparent : Colors.black12,
      ),
      onSelected: (isSelected) {
        toggleChipSelection(isSelected);
      },
      selectedColor: Colors.black26,
      backgroundColor: Colors.transparent,
      showCheckmark: false,
    );
  }
}
