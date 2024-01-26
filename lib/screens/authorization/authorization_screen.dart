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
            title: Text(
              "Log In",
              style: kAppBarTextStyle,
            ),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              Container(
                color: Colors.white,
              ),
              const SafeArea(child: AuthorizationBody()),
            ],
          )),
    );
  }
}
