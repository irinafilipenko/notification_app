import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notification_app/constants.dart';

class ItemCategory extends StatelessWidget {
  final String title;
  final String day;
  final String category;
  final String categoryOpen;

  final String icon;
  final bool isCheck;
  final bool isSelected;
  final bool isLongText;
  final Function() onTapMainItem;
  final Function() onCheck;
  final FontWeight fontWeght;
  const ItemCategory(
      {required this.title,
      this.category = "category",
      this.categoryOpen = "all",
      this.day = "",
      this.isLongText = false,
      required this.onTapMainItem,
      required this.onCheck,
      required this.isCheck,
      required this.icon,
      this.fontWeght = FontWeight.w700,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    EdgeInsets? margin;
    if (categoryOpen == "sport") {
      margin = EdgeInsets.only(left: 50);
    }
    if (category == "onCategory" && !isSelected) {
      margin = EdgeInsets.only(left: 50);
    }
    if (category == "onCategory" && isSelected) {
      margin = EdgeInsets.only(left: 75);
    } else if (categoryOpen == "sub" || category == "activity") {
      margin = EdgeInsets.only(left: 75);
    }
    return GestureDetector(
      onTap: onTapMainItem,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                    crossAxisAlignment: isLongText == true
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
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
                              padding: EdgeInsets.only(
                                  right: 12, top: isLongText == true ? 18 : 0),
                              child: SvgPicture.asset(
                                  "assets/icons/less_icon.svg"))
                          : Padding(
                              padding: EdgeInsets.only(
                                  right: 2, top: isLongText == true ? 18 : 0),
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
                              height: 1.5,
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
            margin: margin,
            width: double.infinity,
            height: 1,
            color: const Color(0xFFF3F3F4),
          )
        ],
      ),
    );
  }
}
