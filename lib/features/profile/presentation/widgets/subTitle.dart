import 'package:find_beer/core/style/app_color.dart';
import 'package:find_beer/core/style/app_fonts.dart';
import 'package:find_beer/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final String subTitle;
  const ProfileItem({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: ScreenSize.width(context) * 0.1,vertical:ScreenSize.height(context) * 0.01 ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: ScreenSize.width(context) * 0.01),
            child: Text(title,
                style: AppTextStyle(context)
                    .textForm
                    .copyWith(color: AppColors.redWine)),
          ),
          SizedBox(height: ScreenSize.height(context)*0.01),
          Container(
            width: ScreenSize.width(context)*0.8,
            padding: EdgeInsets.symmetric(
                horizontal: ScreenSize.width(context) * 0.03,
                vertical: ScreenSize.height(context) * 0.02),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.yellow),
            ),
            child: Text(
              subTitle,
              style: AppTextStyle(context).textForm,
            ),
          )
        ],
      ),
    );
  }
}
