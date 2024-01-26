import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:notification_app/constants.dart';
import 'package:notification_app/screens/recurring/components/body_five_minute.dart';
import 'package:notification_app/screens/recurring/components/body_one_minute.dart';
import 'package:notification_app/screens/recurring/components/body_three_minute.dart';
import 'package:notification_app/screens/recurring/recurring_controller.dart';

class RecurringScreen extends GetView<RecurringController> {
  static String routeName = '/recurring';

  const RecurringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: kAppBarColor,
            elevation: 0.0,
            leading: InkWell(
              child: SvgPicture.asset(
                "assets/icons/arrow_back.svg",
                fit: BoxFit.scaleDown,
              ),
              onTap: () {
                Get.back();
                // Navigator.of(context).pop();
              },
            ),
            title: Obx(() {
              return IndexedStack(
                index: controller.index.value,
                children: [
                  Text(
                    itemList[0],
                    style: kAppBarTextStyle,
                  ),
                  Text(
                    itemList[1],
                    style: kAppBarTextStyle,
                  ),
                  Text(
                    itemList[2],
                    style: kAppBarTextStyle,
                  ),
                ],
              );
            }),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              Container(
                color: Colors.white,
              ),
              SafeArea(
                child: Obx(() {
                  return IndexedStack(
                    index: controller.index.value,
                    children: const [
                      BodyOneMinute(),
                      BodyThreeMinute(),
                      BodyFiveMinute(),
                    ],
                  );
                }),
              ),
            ],
          )),
    );
  }
}
