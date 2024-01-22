// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:notification_app/components/main_button.dart';
import 'package:notification_app/constants.dart';
import 'package:notification_app/screens/home/components/home_body_one_time.dart';
import 'package:notification_app/screens/home/components/home_body_recurring.dart';
import 'package:notification_app/screens/home/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  static String routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text(
          "Notifications",
          style: kAppBarTextStyle,
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFF3F3F4),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: MainButton(
                          height: 40,
                          radius: 6,
                          onPressed: () {
                            controller.currentIndex.value = 0;
                          },
                          color: controller.currentIndex.value == 0
                              ? kMainAppColor
                              : const Color(0xFFF3F3F4),
                          textColor: controller.currentIndex.value == 0
                              ? Colors.white
                              : kAppBarColor,
                          text: "One-time",
                          icon: SvgPicture.asset(
                            "assets/icons/one_time_icon.svg",
                            color: controller.currentIndex.value == 0
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: MainButton(
                          height: 40,
                          radius: 6,
                          onPressed: () {
                            controller.currentIndex.value = 1;
                          },
                          color: controller.currentIndex.value == 1
                              ? kMainAppColor
                              : const Color(0xFFF3F3F4),
                          textColor: controller.currentIndex.value == 1
                              ? Colors.white
                              : kAppBarColor,
                          text: "Recurring",
                          icon: SvgPicture.asset(
                            "assets/icons/recurring_icon.svg",
                            color: controller.currentIndex.value == 1
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }),
            ),
          ),
        ),
      ),
      body: Obx(() {
        return Stack(
          children: [
            Container(
              color: Colors.white,
            ),
            SafeArea(
              child: IndexedStack(
                index: controller.currentIndex.value,
                children: const [HomeBodyOneTime(), HomeBodyRecurring()],
              ),
            ),
          ],
        );
      }),
    );
  }
}
