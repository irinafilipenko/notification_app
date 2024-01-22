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
            style: const TextStyle(
              color: Color(
                0xFF5F5F5F,
              ),
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
            focusNode: controller.focusNode,
            // autofocus: true,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.top,
            cursorWidth: 1,
            cursorHeight: 20,
            cursorColor: const Color(0xFF9F9F9F),
            decoration: kTimeInputDecoration,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            onChanged: (value) {
              controller.nextField(value: value, position: 0);
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
              LengthLimitingTextInputFormatter(1),
            ],
            onChanged: (value) {
              controller.nextField(value: value, position: 1);
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
              LengthLimitingTextInputFormatter(1),
            ],
            onChanged: (value) {
              controller.nextField(value: value, position: 2);
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
              LengthLimitingTextInputFormatter(1),
            ],
            onChanged: (value) {
              controller.nextField(value: value, position: 3);
            },
          ),
        ),
      ],
    );
  }
}
