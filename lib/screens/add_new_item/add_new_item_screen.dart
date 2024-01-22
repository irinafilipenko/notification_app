import 'package:flutter/material.dart';
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
            title: Text(
              "Add new notificaiton",
              style: kAppBarTextStyle,
            ),
            centerTitle: true,
          ),
          body: SafeArea(
              child: AddNewItemBody(
            controller: controller,
          ))),
    );
  }
}
