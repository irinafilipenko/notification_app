import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:notification_app/components/input_item.dart';
import 'package:notification_app/components/main_button.dart';
import 'package:notification_app/constants.dart';

class AddNewItemBody extends StatelessWidget {
  final controller;

  const AddNewItemBody({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      child: Form(
        key: controller.formAddKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Message",
                      style: kAddCartTitleTextStyle,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      minLines: 5,
                      maxLines: null,
                      textAlignVertical: TextAlignVertical.center,
                      controller: controller.titleTextController,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        color: kAppBarColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      cursorColor: kAppBarColor,
                      onChanged: (value) {
                        controller.checkTextfield();
                      },
                      decoration: kTextInputDecoration,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    !controller.isRepeat.value
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Type time",
                                style: kAddCartTitleTextStyle,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              InputItem(
                                controller: controller,
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                            ],
                          )
                        : const SizedBox(),
                    Text(
                      "Icon",
                      style: kAddCartTitleTextStyle,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Obx(() {
                          return Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: controller.selectedIconColor.value != 0
                                  ? Color(controller.selectedIconColor.value)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: kSecondaryButtonColor,
                                width: 1,
                              ),
                            ),
                            child: SvgPicture.asset(
                              controller.selectedIconString.value != ""
                                  ? controller.selectedIconString.value
                                  : "assets/icons/icon_default.svg",
                              fit: BoxFit.scaleDown,
                            ),
                          );
                        }),
                        const SizedBox(
                          width: 16,
                        ),
                        MainButton(
                          width: 158,
                          height: 40,
                          radius: 10,
                          colorBorder: kMainAppColor,
                          text: "Select icon",
                          size: 14,
                          textColor: kMainAppColor,
                          onPressed: () {
                            controller.onBottomSheet();
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Obx(() {
              return Visibility(
                  visible: !controller.isKeyboardOpen.value,
                  child: MainButton(
                      color: controller.isConfirm.value ||
                              controller.isRepeat.value &&
                                  controller.titleTextController.text.isNotEmpty
                          ? kMainAppColor
                          : kSecondaryButtonColor,
                      text: "Confirm",
                      onPressed: () {
                        if (!controller.isRepeat.value) {
                          controller.addItem();
                        } else {
                          controller.addRepeatItem();
                        }
                      }));
            })
          ],
        ),
      ),
    );
  }
}
