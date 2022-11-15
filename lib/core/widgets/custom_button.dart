import 'package:find_beer/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final Function function;
  final String textButton;
  const CustomButton(
      {Key? key,
      required this.backgroundColor,
      required this.function,
      required this.fontColor,
      required this.textButton,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () => function.call(),
        child: Container(
          alignment: Alignment.center,
          width: ScreenSize.width(context),
          padding:  EdgeInsets.symmetric(vertical: ScreenSize.height(context)*0.015),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor),
            borderRadius: const BorderRadius.all(
                Radius.circular(5) //                 <--- border radius here
                ),
          ),
          child: Text(
            textButton,
            style: TextStyle(fontSize: 16, color: fontColor),
          ),
        ),
      ),
    );
  }
}
