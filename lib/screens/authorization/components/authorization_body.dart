import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:notification_app/components/input_item.dart';
import 'package:notification_app/components/main_button.dart';
import 'package:notification_app/constants.dart';
import 'package:notification_app/screens/authorization/authorization_controller.dart';

class AuthorizationBody extends GetView<AuthorizationController> {
  const AuthorizationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 72,
                ),
                Container(
                  height: 32,
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: kAppBarColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: 24,
                  child: Text("Enter current time in hh : mm format",
                      style: kSecondaryTextStyle),
                ),
                const SizedBox(
                  height: 42,
                ),
                Obx(() {
                  return Container(
                    height: 48,
                    child: Text(
                      controller.timeString.value,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        color: kAppBarColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  height: 42,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InputItem(
                      controller: controller,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Obx(() {
            return Visibility(
              visible: controller.isErrorMessage.value &&
                  !controller.isKeyboardOpen.value,
              child: Container(
                margin: const EdgeInsets.only(bottom: 32),
                width: double.infinity,
                height: 48,
                color: const Color(0xFFF3F3F4),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/error_icon.svg",
                        fit: BoxFit.scaleDown,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Text(
                        "The time is wrong. Try again.",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFF43528)),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
          Obx(() {
            return Visibility(
              visible: !controller.isKeyboardOpen.value,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MainButton(
                  color: controller.isConfirm.value
                      ? kMainAppColor
                      : kSecondaryButtonColor,
                  text: "Confirm",
                  radius: 12,
                  onPressed: () {
                    controller.onSendForm();
                  },
                ),
              ),
            );
          }),
          SizedBox(
            height: Platform.isAndroid ? 34 : 10,
          )
        ],
      ),
    );
  }
}
