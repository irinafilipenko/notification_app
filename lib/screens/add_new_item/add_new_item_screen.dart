import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:notification_app/constants.dart';
import 'package:notification_app/screens/add_new_item/add_new_item_controller.dart';
import 'package:notification_app/screens/add_new_item/components/add_new_item_body.dart';

class AddNewIemScreen extends GetView<AddNewItemController> {
  static String routeName = '/add';
  const AddNewIemScreen({super.key});

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
            backgroundColor: Colors.black,
            elevation: 0.0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.30), // цвет тени
                    spreadRadius: 0, // радиус распространения
                    blurRadius: 4, // радиус размытия
                    offset: const Offset(0, 0.5), // смещение тени
                  ),
                ],
              ),
            ),
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
            title: Text(
              "Add new notificaiton",
              style: kAppBarTextStyle,
            ),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              Container(
                color: Colors.white,
              ),
              SafeArea(
                  child: AddNewItemBody(
                controller: controller,
              )),
            ],
          )),
    );
  }
}
