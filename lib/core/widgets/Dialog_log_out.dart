import 'package:find_beer/core/navigation/navigator.dart';
import 'package:find_beer/core/style/app_color.dart';
import 'package:find_beer/core/style/app_fonts.dart';
import 'package:find_beer/core/utils/screen_size.dart';
import 'package:find_beer/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
class DialogLogOut extends StatelessWidget {
  const DialogLogOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Center(child: Image.asset('assets/icons/breweries.png',height: ScreenSize.height(context)*0.2,)),
           Padding(
             padding:  EdgeInsets.symmetric(horizontal: ScreenSize.width(context)*0.05,vertical: ScreenSize.height(context)*0.01),
             child: Text('Are you sure that you want to exit?',
             textAlign: TextAlign.center, style: AppTextStyle(context).header,),
           ),
          SizedBox(height: ScreenSize.height(context)*0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: ScreenSize.width(context)*0.45,
                child: CustomButton(
                  backgroundColor: Colors.transparent,
                  function: () => AppNavigator.pop(),
                  fontColor: AppColors.brown,
                  textButton: 'Cancel',
                  borderColor: AppColors.brown),
              ), Container(
                width: ScreenSize.width(context)*0.45,
                child: CustomButton(
                  backgroundColor: AppColors.brown,
                  function: () => AppNavigator.pushNamedAndRemoveUntil(Routes.LOGIN, arguments: 2),
                  fontColor: AppColors.white,
                  textButton: 'Accept',
                  borderColor: AppColors.brown,),
              ),
            ],
          )
        ],
      ),
    );
  }
}
