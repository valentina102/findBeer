import '../../../../core/style/app_color.dart';
import '../../../../core/style/app_fonts.dart';
import '../../../../core/utils/screen_size.dart';
import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function onFocus;
  final bool isFocus;
  final bool obscureText;
  final bool fieldPassword;
  final IconData prefixIcon;
  final String suffixIcon;
  final String invalidMessage;
  final Function suffixFunction;
  final bool enable;
  final bool Function(String?) validateField;
  const TextForm(
      {required this.controller,
      this.suffixIcon = 'assets/icon/icons-visible.png',
      required this.obscureText,
      required this.onFocus,
      required this.invalidMessage,
      required this.prefixIcon,
      required this.fieldPassword,
      required this.hintText,
      required this.isFocus,
      required this.suffixFunction,
      required this.validateField,
        this.enable = true,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenSize.width(context) * 0.1),
      child: Focus(
        onFocusChange: (focused) => onFocus(focused),
        child: TextFormField(
          enabled: enable ,
          controller: controller,
          validator: (value) {
            if (validateField(value))
              return null;
            else
              return invalidMessage;
          },
          obscureText: obscureText,
          style:
              AppTextStyle(context).textForm.copyWith(color: AppColors.black),
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.yellow),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.yellow),
            ),
            labelText: hintText,
            labelStyle: isFocus
                ? AppTextStyle(context)
                    .textForm
                    .copyWith(color: AppColors.redWine)
                : AppTextStyle(context).textForm,
            prefixIcon: Icon(
              prefixIcon,
              size: 27,
              color: isFocus ? AppColors.black : AppColors.black,
            ),
            suffixIcon: IconButton(
              icon: fieldPassword
                  ? obscureText
                      ? Icon(Icons.remove_red_eye_outlined)
                      : Icon(Icons.visibility_off_outlined)
                  : const Icon(Icons.cancel_sharp),
              color: controller.text != ""
                  ? AppColors.redWine
                  : Colors.transparent,
              onPressed: fieldPassword
                  ? () => suffixFunction()
                  : () {
                      controller.clear();
                    },
            ),
          ),
        ),
      ),
    );
  }
}
