import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:notification_app/components/main_button.dart';
import 'package:notification_app/constants.dart';

class SelectIconBottomSheet extends StatefulWidget {
  final Function(int, String?) onPressed;
  const SelectIconBottomSheet({super.key, required this.onPressed});

  @override
  _SelectIconBottomSheet createState() => _SelectIconBottomSheet();
}

class _SelectIconBottomSheet extends State<SelectIconBottomSheet> {
  int? selectedIndexColor;
  int? selectedIndexIcon;
  int selectedColor = 0;
  String? selectedIcon = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      constraints: BoxConstraints(maxHeight: Get.height * 0.55),
      width: Get.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Icon style",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: kAppBarColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset("assets/icons/button_close.svg"))
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            color: Color(0xFFF3F3F4),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "Background colors",
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Color(0xFF747377),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 11,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(colorsList.length, (index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedIndexColor = index;
                    selectedColor = colorsList[selectedIndexColor!];
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selectedIndexColor == index
                          ? kMainAppColor
                          : Colors.transparent,
                      width: 3,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      width: 62,
                      height: 62,
                      decoration: BoxDecoration(
                        color: Color(colorsList[index]),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: const Color(0xFFE6E6E6),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Select icons",
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Color(0xFF747377),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 11,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(iconList.length, (index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedIndexIcon = index;
                    selectedIcon = iconList[selectedIndexIcon!];
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selectedIndexIcon == index
                          ? kMainAppColor
                          : Colors.transparent,
                      width: 3,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      width: 62,
                      height: 62,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: const Color(0xFFE6E6E6),
                          width: 1,
                        ),
                      ),
                      child: SvgPicture.asset(
                        iconList[index],
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          const Spacer(),
          MainButton(
              color: kMainAppColor,
              text: "Save changes",
              onPressed: () {
                widget.onPressed(selectedColor, selectedIcon);
              }),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
