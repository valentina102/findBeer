import 'package:find_beer/core/navigation/navigator.dart';
import 'package:find_beer/core/style/app_color.dart';
import 'package:find_beer/core/style/app_fonts.dart';
import 'package:find_beer/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final bool showIcon;
  final bool showLogo;
  const Header(
      {Key? key,
      required this.title,
      required this.showIcon,
      required this.showLogo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.height(context) * 0.2,
      color: AppColors.bone,
      child: Stack(
        children: [
          Center(
            child: showLogo
                ? Padding(
                    padding:
                        EdgeInsets.only(top: ScreenSize.height(context) * 0.07),
                    child: Image.asset('assets/icons/logo.png'),
                  )
                : Text(
                    title,
                    style: AppTextStyle(context).header,
                  ),
          ),
          Visibility(
            visible: showIcon,
            child: Positioned(
              top: ScreenSize.height(context) * 0.08,
              right: ScreenSize.width(context) * 0.04,
              child: InkWell(
                onTap: () => AppNavigator.push(Routes.DIALOGLOGOUT),
                child: Image.asset('assets/icons/log-out.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
