import 'package:flutter/material.dart';
import 'package:notification_app/constants.dart';
import 'package:notification_app/screens/authorization/components/authorization_body.dart';

class AuthorizationScreen extends StatelessWidget {
  static String routeName = '/authorization';
  const AuthorizationScreen({super.key});

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
            title: Text(
              "Log In",
              style: kAppBarTextStyle,
            ),
            centerTitle: true,
          ),
          body: const SafeArea(child: AuthorizationBody())),
    );
  }
}
