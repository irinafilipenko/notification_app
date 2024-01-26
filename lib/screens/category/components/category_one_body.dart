import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:notification_app/constants.dart';
import 'package:notification_app/screens/category/category_controller.dart';
import 'package:notification_app/screens/category/components/item_category.dart';

class CategoryOneBody extends GetView<CategoryTwoController> {
  const CategoryOneBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 56,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: const Color(0xFFF3F3F4),
                ),
              ),
            ),
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "All Trigers",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: kAppBarColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                Obx(() {
                  return GestureDetector(
                      onTap: () {
                        controller.onCheckAll();
                      },
                      child: SvgPicture.asset(controller.isCheckOneAll.value
                          ? "assets/icons/checkbox.svg"
                          : 'assets/icons/checkbox_empty.svg'));
                }),
              ],
            ),
          ),
          Stack(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.categoryList.length,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      return Column(
                        children: [
                          ItemCategory(
                            onTapMainItem: () {
                              controller.categoryList[index].isSelected =
                                  !controller.categoryList[index].isSelected;
                              if (controller.categoryList[index].title ==
                                  "Sport") {
                                controller.isSportOpen.value =
                                    !controller.isSportOpen.value;
                              }
                              if (controller.categoryList[index].title ==
                                  "Work") {
                                controller.isWorkOpen.value =
                                    !controller.isWorkOpen.value;
                              }
                              controller.onTopDotsWork();
                              controller.onTopLineWork();
                              controller.categoryList.refresh();
                            },
                            onCheck: () {
                              controller.categoryList[index].isCheck =
                                  !controller.categoryList[index].isCheck;
                              controller.categoryList.refresh();
                            },
                            categoryOpen:
                                controller.categoryList[index].isSelected
                                    ? "sport"
                                    : "all",
                            title: controller.categoryList[index].title,
                            isCheck: controller.categoryList[index].isCheck,
                            icon: controller.categoryList[index].mainIcon,
                            isSelected:
                                controller.categoryList[index].isSelected,
                          ),
                          Visibility(
                            visible: controller.categoryList[index].isSelected,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller
                                    .categoryList[index].subCategories.length,
                                itemBuilder: (context, ind) {
                                  return Column(
                                    children: [
                                      ItemCategory(
                                        onTapMainItem: () {
                                          controller
                                                  .categoryList[index]
                                                  .subCategories[ind]
                                                  .isSelected =
                                              !controller
                                                  .categoryList[index]
                                                  .subCategories[ind]
                                                  .isSelected;
                                          if (controller
                                                      .categoryList[index]
                                                      .subCategories[ind]
                                                      .title ==
                                                  'Some very long names of action with many symbols in two, three, or four lines with text; the limit should be four lines.' ||
                                              controller
                                                      .categoryList[index]
                                                      .subCategories[ind]
                                                      .title ==
                                                  'Morning') {
                                            controller.isSameVeryOpen.value =
                                                !controller
                                                    .isSameVeryOpen.value;
                                          }
                                          if (controller.categoryList[index]
                                                  .subCategories[ind].title ==
                                              'Evening') {
                                            controller.isEveningOpen.value =
                                                !controller.isEveningOpen.value;
                                          }
                                          controller.onTopDotsWork();
                                          controller.onTopLineWork();
                                          controller.categoryList.refresh();
                                        },
                                        isLongText: controller
                                            .categoryList[index]
                                            .subCategories[ind]
                                            .isLongText,
                                        onCheck: () {
                                          controller.categoryList[index]
                                                  .subCategories[ind].isCheck =
                                              !controller.categoryList[index]
                                                  .subCategories[ind].isCheck;
                                          controller.categoryList.refresh();
                                        },
                                        title: controller.categoryList[index]
                                            .subCategories[ind].title,
                                        isCheck: controller.categoryList[index]
                                            .subCategories[ind].isCheck,
                                        fontWeght: controller
                                                    .categoryList[index]
                                                    .subCategories[ind]
                                                    .day ==
                                                "day"
                                            ? FontWeight.w700
                                            : FontWeight.w400,
                                        icon: controller.categoryList[index]
                                            .subCategories[ind].middleIcon,
                                        isSelected: controller
                                            .categoryList[index]
                                            .subCategories[ind]
                                            .isSelected,
                                        category: controller
                                                .categoryList[index].isSelected
                                            ? controller.categoryList[index]
                                                .subCategories[ind].category
                                            : "category",
                                        day: controller.categoryList[index]
                                            .subCategories[ind].day,
                                      ),
                                      Visibility(
                                          visible: controller
                                              .categoryList[index]
                                              .subCategories[ind]
                                              .isSelected,
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: controller
                                                  .categoryList[index]
                                                  .subCategories[ind]
                                                  .activities
                                                  .length,
                                              itemBuilder: (context, idx) {
                                                return ItemCategory(
                                                  onTapMainItem: () {
                                                    controller
                                                            .categoryList[index]
                                                            .subCategories[ind]
                                                            .activities[idx]
                                                            .isSelected =
                                                        !controller
                                                            .categoryList[index]
                                                            .subCategories[ind]
                                                            .activities[idx]
                                                            .isSelected;
                                                    controller.categoryList
                                                        .refresh();
                                                  },
                                                  onCheck: () {
                                                    controller
                                                            .categoryList[index]
                                                            .subCategories[ind]
                                                            .activities[idx]
                                                            .isCheck =
                                                        !controller
                                                            .categoryList[index]
                                                            .subCategories[ind]
                                                            .activities[idx]
                                                            .isCheck;
                                                    controller.categoryList
                                                        .refresh();
                                                  },
                                                  isLongText: controller
                                                      .categoryList[index]
                                                      .subCategories[ind]
                                                      .activities[idx]
                                                      .isLongText,
                                                  title: controller
                                                      .categoryList[index]
                                                      .subCategories[ind]
                                                      .activities[idx]
                                                      .title,
                                                  isCheck: controller
                                                      .categoryList[index]
                                                      .subCategories[ind]
                                                      .activities[idx]
                                                      .isCheck,
                                                  fontWeght: FontWeight.w400,
                                                  icon: controller
                                                      .categoryList[index]
                                                      .subCategories[ind]
                                                      .activities[idx]
                                                      .secondIcon,
                                                  isSelected: controller
                                                      .categoryList[index]
                                                      .subCategories[ind]
                                                      .activities[idx]
                                                      .isSelected,
                                                  category: controller
                                                          .categoryList[index]
                                                          .subCategories[ind]
                                                          .isSelected
                                                      ? controller
                                                          .categoryList[index]
                                                          .subCategories[ind]
                                                          .activities[idx]
                                                          .category
                                                      : "category",
                                                );
                                              }))
                                    ],
                                  );
                                }),
                          )
                        ],
                      );
                    });
                  }),
              Obx(() {
                return Visibility(
                  visible: controller.isSportOpen.value,
                  child: Positioned(
                    top: 59,
                    left: 27,
                    child: () {
                      // Check the conditions
                      if (controller.isSameVeryOpen.value &&
                          !controller.isEveningOpen.value) {
                        // First condition met, return first Column
                        return Column(
                          children: [
                            SvgPicture.asset("assets/icons/line2.svg"),
                            SvgPicture.asset("assets/icons/line2.svg"),
                            SvgPicture.asset("assets/icons/line2.svg"),
                            SvgPicture.asset("assets/icons/line2.svg"),
                            SvgPicture.asset("assets/icons/line2.svg"),
                            SvgPicture.asset("assets/icons/line3.svg"),
                          ],
                        );
                      }
                      if (!controller.isSameVeryOpen.value &&
                          controller.isEveningOpen.value) {
                        // First condition met, return first Column
                        return Column(
                          children: [
                            SvgPicture.asset("assets/icons/line2.svg"),
                            SvgPicture.asset("assets/icons/line2.svg"),
                            SvgPicture.asset("assets/icons/line2.svg"),
                            SvgPicture.asset("assets/icons/line2.svg"),
                            SvgPicture.asset("assets/icons/line2.svg"),
                            SvgPicture.asset("assets/icons/line3.svg"),
                          ],
                        );
                      }
                      if (controller.isSameVeryOpen.value &&
                          controller.isEveningOpen.value) {
                        // First condition met, return first Column
                        return Column(
                          children: [
                            SvgPicture.asset("assets/icons/line2.svg"),
                            SvgPicture.asset("assets/icons/line2.svg"),
                            SvgPicture.asset("assets/icons/line2.svg"),
                            SvgPicture.asset("assets/icons/line2.svg"),
                            SvgPicture.asset("assets/icons/lines1.svg"),
                            SvgPicture.asset("assets/icons/line2.svg"),
                            SvgPicture.asset("assets/icons/line3.svg"),

                            // SvgPicture.asset("assets/icons/line3.svg"),
                          ],
                        );
                      } else {
                        // Condition not met, return second Column
                        return Column(
                          children: [
                            SvgPicture.asset("assets/icons/line2.svg"),
                            SvgPicture.asset("assets/icons/line2.svg"),
                            SvgPicture.asset("assets/icons/line2.svg"),
                            SvgPicture.asset("assets/icons/line3.svg"),
                          ],
                        );
                      }
                    }(),
                  ),
                );
              }),
              Obx(() {
                return Visibility(
                  visible: controller.isSportOpen.value,
                  child: Positioned(
                      top: 82,
                      left: 25,
                      child: Column(
                        children: [
                          SvgPicture.asset("assets/icons/circle.svg"),
                          SizedBox(height: 48),
                          SvgPicture.asset("assets/icons/circle.svg"),
                          if (controller.isSameVeryOpen.value &&
                              !controller.isEveningOpen.value) ...[
                            SizedBox(height: 48),
                            SvgPicture.asset("assets/icons/circle.svg"),
                            SizedBox(height: 48),
                            SvgPicture.asset("assets/icons/circle.svg"),
                            SizedBox(height: 48),
                            SvgPicture.asset("assets/icons/circle.svg"),
                            SizedBox(height: 48),
                            SvgPicture.asset("assets/icons/circle.svg"),
                          ],
                          if (!controller.isSameVeryOpen.value &&
                              controller.isEveningOpen.value) ...[
                            SizedBox(height: 48),
                            SvgPicture.asset("assets/icons/circle.svg"),
                            SizedBox(height: 48),
                            SvgPicture.asset("assets/icons/circle.svg"),
                            SizedBox(height: 48),
                            SvgPicture.asset("assets/icons/circle.svg"),
                            SizedBox(height: 48),
                            SvgPicture.asset("assets/icons/circle.svg"),
                          ],
                          if (!controller.isSameVeryOpen.value &&
                              !controller.isEveningOpen.value) ...[
                            SizedBox(height: 48),
                            SvgPicture.asset("assets/icons/circle.svg"),
                            SizedBox(height: 48),
                            SvgPicture.asset("assets/icons/circle.svg"),
                          ],
                          if (controller.isSameVeryOpen.value &&
                              controller.isEveningOpen.value) ...[
                            SizedBox(height: 48),
                            SvgPicture.asset("assets/icons/circle.svg"),
                            SizedBox(height: 48),
                            SvgPicture.asset("assets/icons/circle.svg"),
                            SizedBox(height: 174),
                            SvgPicture.asset("assets/icons/circle.svg"),
                            SizedBox(height: 48),
                            SvgPicture.asset("assets/icons/circle.svg"),
                          ]
                        ],
                      )),
                );
              }),
              Obx(() {
                return Visibility(
                  visible: controller.isSameVeryOpen.value,
                  child: Positioned(
                      top: 116,
                      left: 60,
                      child: Column(
                        children: [
                          SvgPicture.asset("assets/icons/line2.svg"),
                          SvgPicture.asset("assets/icons/line3.svg"),
                        ],
                      )),
                );
              }),
              Obx(() {
                return Visibility(
                  visible: controller.isSameVeryOpen.value,
                  child: Positioned(
                      top: 140,
                      left: 58,
                      child: Column(
                        children: [
                          SvgPicture.asset("assets/icons/circle.svg"),
                          SizedBox(
                            height: 48,
                          ),
                          SvgPicture.asset("assets/icons/circle.svg"),
                        ],
                      )),
                );
              }),
              Obx(() {
                return Visibility(
                  visible: controller.isWorkOpen.value,
                  child: Positioned(
                      top: controller.topLine.value,
                      left: 27,
                      child: Column(
                        children: [
                          SvgPicture.asset("assets/icons/line2.svg"),
                          SvgPicture.asset("assets/icons/line3.svg"),
                        ],
                      )),
                );
              }),
              Obx(() {
                return Visibility(
                  visible: controller.isWorkOpen.value,
                  child: Positioned(
                      top: controller.topDots.value,
                      left: 25,
                      child: Column(
                        children: [
                          SvgPicture.asset("assets/icons/circle.svg"),
                          SizedBox(
                            height: 48,
                          ),
                          SvgPicture.asset("assets/icons/circle.svg"),
                        ],
                      )),
                );
              }),
              Obx(() {
                return Visibility(
                  visible: controller.isEveningOpen.value,
                  child: Positioned(
                      top: !controller.isSameVeryOpen.value ? 172 : 288,
                      left: 58,
                      child: Column(
                        children: [
                          SvgPicture.asset("assets/icons/line2.svg"),
                          SvgPicture.asset("assets/icons/line3.svg"),
                        ],
                      )),
                );
              }),
              Obx(() {
                return Visibility(
                  visible: controller.isEveningOpen.value,
                  child: Positioned(
                      top: !controller.isSameVeryOpen.value ? 195 : 312,
                      left: 56,
                      child: Column(
                        children: [
                          SvgPicture.asset("assets/icons/circle.svg"),
                          SizedBox(
                            height: 48,
                          ),
                          SvgPicture.asset("assets/icons/circle.svg"),
                        ],
                      )),
                );
              })
            ],
          ),
        ],
      ),
    );
  }
}
