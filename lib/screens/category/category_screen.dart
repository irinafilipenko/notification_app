import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:notification_app/screens/category/category_controller.dart';
import 'package:notification_app/screens/category/components/category_one_body.dart';
import 'package:notification_app/screens/category/components/category_two_body.dart';
import '../../constants.dart';

class CategoryScreen extends GetView<CategoryTwoController> {
  static String routeName = "/category_two";

  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          flexibleSpace: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.30), // цвет тени
                  spreadRadius: 0, // радиус распространения
                  blurRadius: 4, // радиус размытия
                  offset: Offset(0, 0.5), // смещение тени
                ),
              ],
            ),
          ),
          title: Obx(() {
            return IndexedStack(
              index: controller.indexScreen.value,
              children: [
                Text(
                  "Select triger 1",
                  style: kAppBarTextStyle,
                ),
                Text(
                  "Select triger 2",
                  style: kAppBarTextStyle,
                ),
              ],
            );
          }),
          centerTitle: true,
        ),
        body: Obx(() {
          return Stack(children: [
            Container(
              color: Colors.white,
            ),
            SafeArea(
              child: IndexedStack(
                index: controller.indexScreen.value,
                children: const [
                  CategoryTwoBody(),
                  CategoryOneBody(),
                ],
              ),
            ),
          ]);
        }));
  }
}
