import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notification_app/constants.dart';

class RecuringCard extends StatelessWidget {
  final String text;
  final Function() onTap;
  const RecuringCard({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: const BoxDecoration(
          color: Color(0xFFF8FAFB),
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFE6E6E6),
              width: 1.0,
            ),
          ),
        ),
        child: ListTile(
          leading: SizedBox(
            height: 24,
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Roboto',
                color: kAppBarColor,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          trailing: SvgPicture.asset("assets/icons/arrow_icon.svg"),
        ),
      ),
    );
  }
}
