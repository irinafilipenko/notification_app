import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notification_app/constants.dart';

class ItemCategory extends StatelessWidget {
  final String title;
  final String day;
  final String category;
  final String icon;
  final bool isCheck;
  final bool isSelected;
  final Function() onTapMainItem;
  final Function() onCheck;
  final FontWeight fontWeght;
  const ItemCategory(
      {required this.title,
      this.category = "category",
      this.day = "",
      required this.onTapMainItem,
      required this.onCheck,
      required this.isCheck,
      required this.icon,
      this.fontWeght = FontWeight.w700,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapMainItem,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      category == "onCategory"
                          ? Container(
                              margin:
                                  const EdgeInsets.only(right: 20, left: 15),
                              width: 1,
                              color: const Color(0xFFE6E6E6),
                            )
                          : const SizedBox(),
                      category == "activity"
                          ? Container(
                              margin:
                                  const EdgeInsets.only(right: 20, left: 50),
                              width: 1,
                              color: const Color(0xFFE6E6E6),
                            )
                          : const SizedBox(),
                      isSelected
                          ? Container(
                              padding:
                                  const EdgeInsets.only(right: 12, top: 12),
                              child: SvgPicture.asset(
                                  "assets/icons/less_icon.svg"))
                          : Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(icon),
                            ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            title,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: kAppBarColor,
                              fontWeight: fontWeght,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: GestureDetector(
                      onTap: onCheck,
                      child: SvgPicture.asset(isCheck
                          ? "assets/icons/checkbox.svg"
                          : "assets/icons/checkbox_empty.svg")),
                ),
              ],
            ),
          ),
          Container(
            margin: category == "onCategory"
                ? const EdgeInsets.only(left: 50)
                : category == "activity"
                    ? const EdgeInsets.only(left: 80)
                    : null,
            width: double.infinity,
            height: 1,
            color: const Color(0xFFE6E6E6),
          )
        ],
      ),
    );
  }
}
