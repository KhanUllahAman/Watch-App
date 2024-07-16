// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insomnia_app/Services/helper_service.dart';
import 'package:insomnia_app/Widgets/custom_nav_bar.dart';

import '../../Constants/app_styles.dart';
import 'components/validation_container.dart';

class CardDetailsScreen extends StatefulWidget {
  final PageController controller;
  const CardDetailsScreen({super.key, required this.controller});

  @override
  State<CardDetailsScreen> createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends State<CardDetailsScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = true;
  OutlineInputBorder? border,
      errorborder,
      focusedborder,
      enabledborder,
      focusedErrorBorder;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.w,
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(
        20.r,
      ),
    );
    focusedborder = OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.w,
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(
        20.r,
      ),
    );
    enabledborder = OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.w,
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(
        20.r,
      ),
    );
    focusedErrorBorder = OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.w,
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(
        20.r,
      ),
    );
    errorborder = OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.w,
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(
        20.r,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 10.h,
              ),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        widget.controller.previousPage(
                          duration: const Duration(microseconds: 300),
                          curve: Curves.easeOutBack,
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppStyles.onPrimary,
                      )),
                  Text(
                    'Payment',
                    style: AppStyles().bodyTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.8,
                          fontSize: 22.sp,
                        ),
                  ),
                ],
              ),
            ),
            CreditCardWidget(
              glassmorphismConfig:
                  useGlassMorphism ? Glassmorphism.defaultConfig() : null,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              bankName: '',
              frontCardBorder:
                  !useGlassMorphism ? Border.all(color: Colors.grey) : null,
              backCardBorder:
                  !useGlassMorphism ? Border.all(color: Colors.grey) : null,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              cardBgColor: Colors.black,
              backgroundImage: useBackgroundImage ? 'assets/card_bg.jpg' : null,
              isSwipeGestureEnabled: true,
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
              customCardTypeIcons: <CustomCardTypeIcon>[
                CustomCardTypeIcon(
                  cardType: CardType.mastercard,
                  cardImage: Image.asset(
                    'assets/icons/mastercard.png',
                    height: 48,
                    width: 48,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CreditCardForm(
                      formKey: formKey,
                      obscureCvv: true,
                      obscureNumber: true,
                      cardNumber: cardNumber,
                      cvvCode: cvvCode,
                      isHolderNameVisible: true,
                      isCardNumberVisible: true,
                      isExpiryDateVisible: true,
                      cardHolderName: cardHolderName,
                      expiryDate: expiryDate,
                      themeColor: Colors.black,
                      textColor: Colors.grey,
                      cardNumberDecoration: InputDecoration(
                        labelText: 'Card Number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                        hintStyle: const TextStyle(color: Colors.grey),
                        labelStyle: const TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: const Color(0xffF2F3F7),
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        errorBorder: errorborder,
                        focusedErrorBorder: focusedErrorBorder,
                        border: border,
                        disabledBorder: focusedErrorBorder,
                        focusedBorder: focusedborder,
                        enabledBorder: enabledborder,
                      ),
                      expiryDateDecoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffF2F3F7),
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hintStyle: const TextStyle(color: Colors.grey),
                        labelStyle: const TextStyle(color: Colors.black),
                        errorBorder: errorborder,
                        focusedErrorBorder: focusedErrorBorder,
                        border: border,
                        disabledBorder: focusedErrorBorder,
                        focusedBorder: focusedborder,
                        enabledBorder: enabledborder,
                        labelText: 'Expire Date',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.grey),
                        labelStyle: const TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: const Color(0xffF2F3F7),
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        errorBorder: errorborder,
                        focusedErrorBorder: focusedErrorBorder,
                        border: border,
                        disabledBorder: focusedErrorBorder,
                        focusedBorder: focusedborder,
                        enabledBorder: enabledborder,
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.grey),
                        labelStyle: const TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: const Color(0xffF2F3F7),
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        errorBorder: errorborder,
                        focusedErrorBorder: focusedErrorBorder,
                        border: border,
                        disabledBorder: focusedErrorBorder,
                        focusedBorder: focusedborder,
                        enabledBorder: enabledborder,
                        labelText: 'Card Holder Name',
                      ),
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                      onTap: _onValidate,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppStyles.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: const Text(
                          'Pay Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'halter',
                            fontSize: 14,
                            package: 'flutter_credit_card',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onValidate() async {
    if (formKey.currentState!.validate()) {
      await HelperService.saveIsPremiumUser(true);
      Navigator.pushReplacementNamed(
        context,
        CustomNavBar.routeName,
      );
      await showDialog(
          barrierColor: Colors.black54,
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return const ValidationContainer(
              icon: Icons.check_circle,
              iconColor: Colors.green,
              text: 'Successful!',
              description: "Payment Successful!",
              buttonTitle: 'Close',
            );
          });
    } else {
      const ValidationContainer(
        icon: Icons.cancel_rounded,
        iconColor: Colors.red,
        text: 'Unsuccessful!',
        description: "Check your credentials and \ntry again",
        buttonTitle: 'Try Again',
      );
    }
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
