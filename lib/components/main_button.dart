import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

class MainButton extends StatelessWidget {
  final Widget? icon;
  final Color? color;
  final Color colorBorder;
  final String? text;
  final Function() onPressed;
  final double? verticalPadding;
  final double size;
  final double radius;
  final double width;
  final double height;
  final FontWeight fontWeght;
  final Color textColor;

  const MainButton(
      {Key? key,
      this.text,
      required this.onPressed,
      this.verticalPadding,
      this.icon,
      this.color,
      this.size = 16,
      this.height = 56,
      this.width = double.infinity,
      this.colorBorder = Colors.transparent,
      this.textColor = Colors.white,
      this.fontWeght = FontWeight.w700,
      this.radius = 8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounce(
        duration: const Duration(milliseconds: 110),
        onPressed: onPressed,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(
              color: colorBorder,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? const SizedBox(),
              icon == null
                  ? const SizedBox()
                  : const SizedBox(
                      width: 6,
                    ),
              Flexible(
                child: Text(
                  text ?? '',
                  textScaleFactor: 1,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: "Roboto",
                      color: textColor,
                      fontWeight: fontWeght,
                      fontSize: size),
                ),
              ),
            ],
          ),
        ));
  }
}
