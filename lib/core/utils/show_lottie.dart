import 'package:find_beer/core/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Future<Widget?> showLottie({required BuildContext context}) {
  return showDialog<Widget>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SizedBox(
              height: ScreenSize.height(context) * 0.20,
              width: ScreenSize.height(context) * 0.20,
              child: Center(
                child: Lottie.asset('assets/lottie/lottie_loading.json'),
              ),
            ),
          ),);
    },
  );
}
