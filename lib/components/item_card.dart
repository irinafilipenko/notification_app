import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:notification_app/components/main_button.dart';
import 'package:notification_app/constants.dart';

class ItemCard extends StatelessWidget {
  final String text;
  final String? time;
  final String icon;
  final int color;
  final Function() onDelete;
  final Function() onEdit;

  const ItemCard(
      {Key? key,
      required this.text,
      this.time,
      required this.onDelete,
      required this.onEdit,
      required this.icon,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onEdit,
      child: Container(
        padding:
            const EdgeInsets.only(top: 14, bottom: 16, right: 16, left: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFB),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: kMainAppColor,
            width: 1,
          ),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                icon == "" && color == 0
                    ? const SizedBox()
                    : Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: color == 0 ? Colors.transparent : Color(color),
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: kSecondaryButtonColor,
                            width: 1,
                          ),
                        ),
                        child: icon == ""
                            ? const SizedBox()
                            : Center(
                                child: SvgPicture.asset(
                                  icon,
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                      ),
                time == "" || time == null
                    ? const SizedBox()
                    : Row(
                        children: [
                          Text("Time:", style: kCardItemDescriptionTextStyle),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(time!, style: kCardItemTitleTextStyle),
                        ],
                      ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text("Message:", style: kCardItemDescriptionTextStyle),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: Text(text,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: kCardItemTitleTextStyle))
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MainButton(
                      width: 158,
                      height: 40,
                      text: "Select triger 1",
                      textColor: kMainAppColor,
                      size: 14,
                      onPressed: () {
                        Get.toNamed("/category_two", arguments: [
                          {"index": 0},
                        ]);
                      },
                      color: Colors.white,
                      colorBorder: kMainAppColor,
                      radius: 10,
                    ),
                    MainButton(
                      width: 158,
                      height: 40,
                      text: "Select triger 2",
                      textColor: kMainAppColor,
                      size: 14,
                      onPressed: () {
                        Get.toNamed("/category_two", arguments: [
                          {"index": 1},
                        ]);
                      },
                      color: Colors.white,
                      colorBorder: kMainAppColor,
                      radius: 10,
                    ),
                  ],
                )
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                  onTap: onDelete,
                  child: SvgPicture.asset("assets/icons/delete_icon.svg")),
            )
          ],
        ),
      ),
    );
  }
}
