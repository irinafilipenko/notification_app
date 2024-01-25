import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notification_app/constants.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notification_app/constants.dart';

class InputItem extends StatelessWidget {
  final controller;

  const InputItem({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 48,
          width: 44,
          // width: getProportionateScreenWidth(43),
          child: TextFormField(
            controller: controller.fieldOneController,
            focusNode: controller.fieldOneFocusNode,
            // focusNode: controller.fieldOneFocusNode,
            style: const TextStyle(
              color: Color(
                0xFF5F5F5F,
              ),
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),

            // autofocus: true,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.top,
            cursorWidth: 1,
            cursorHeight: 20,
            cursorColor: const Color(0xFF9F9F9F),
            decoration: kTimeInputDecoration,
            inputFormatters: [
              LengthLimitingTextInputFormatter(2),
            ],
            onChanged: (value) {
              controller.nextField(
                  value: value,
                  position: 0,
                  focusNode: controller.fieldOneFocusNode);
            },
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        SizedBox(
          height: 48,
          width: 44,
          // width: getProportionateScreenWidth(43),
          child: TextFormField(
            controller: controller.fieldTwoController,
            focusNode: controller.fieldTwoFocusNode,
            style: const TextStyle(
              color: Color(
                0xFF5F5F5F,
              ),
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.top,
            cursorWidth: 1,
            cursorHeight: 20,
            cursorColor: const Color(0xFF9F9F9F),
            decoration: kTimeInputDecoration,
            inputFormatters: [
              LengthLimitingTextInputFormatter(2),
            ],
            onChanged: (value) {
              print(value);
              if (value.isEmpty) {
                // Если поле пустое, устанавливаем символ \u200b
                controller.fieldTwoController.text = '\u200b';
                // controller.fieldTwoFocusNode.previousFocus();
                // print("isEmpty");
              }
              controller.nextField(
                  value: value,
                  position: 1,
                  focusNode: controller.fieldTwoFocusNode);
              // controller.fieldTwoController.text = '\u200b$value';
              // print(controller.fieldTwoController.text);
              // if (controller.fieldTwoController.text != "\u200b") {
              //   print("isNotEmpty");
              // } else {
              //   print("isEmpty");
              //   // controller.nextField(value: value, position: 1);
              // }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SvgPicture.asset(
            "assets/icons/dots.svg",
            fit: BoxFit.scaleDown,
          ),
        ),
        SizedBox(
          height: 48,
          width: 44,
          // width: getProportionateScreenWidth(43),
          child: TextFormField(
            controller: controller.fieldThreeController,
            focusNode: controller.fieldThreeFocusNode,
            style: const TextStyle(
              color: Color(
                0xFF5F5F5F,
              ),
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.top,
            cursorWidth: 1,
            cursorHeight: 20,
            cursorColor: const Color(0xFF9F9F9F),
            decoration: kTimeInputDecoration,
            inputFormatters: [
              LengthLimitingTextInputFormatter(2),
            ],
            onChanged: (value) {
              if (value.isEmpty) {
                // Если поле пустое, устанавливаем символ \u200b
                controller.fieldThreeController.text = '\u200b';
                // controller.fieldThreeFocusNode.previousFocus();
                // print("isEmpty");
              }
              controller.nextField(
                  value: value,
                  position: 2,
                  focusNode: controller.fieldThreeFocusNode);
            },
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        SizedBox(
          height: 48,
          width: 44,
          child: TextFormField(
            controller: controller.fieldFourController,
            focusNode: controller.fieldFourFocusNode,
            style: const TextStyle(
              color: Color(
                0xFF5F5F5F,
              ),
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.top,
            cursorWidth: 1,
            cursorHeight: 20,
            cursorColor: const Color(0xFF9F9F9F),
            decoration: kTimeInputDecoration,
            inputFormatters: [
              LengthLimitingTextInputFormatter(2),
            ],
            onChanged: (value) {
              if (value.isEmpty) {
                // Если поле пустое, устанавливаем символ \u200b
                controller.fieldFourController.text = '\u200b';
                // controller.fieldFourFocusNode.previousFocus();
                // print("isEmpty");
              }
              controller.nextField(
                  value: value,
                  position: 3,
                  focusNode: controller.fieldFourFocusNode);
            },
          ),
        ),
      ],
    );
  }
}
