import 'package:find_beer/core/utils/screen_size.dart';
import 'package:flutter/material.dart';
class RequestLocation extends StatelessWidget {
  final Function askGpsAccess;
  const RequestLocation({
    required this.askGpsAccess,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(ScreenSize.height(context)*0.05),
              child: Image.asset('assets/icons/breweries.png')
            ),
            Text("Necesita Acceso"),
          ],
        ),
      ),
    );
  }
}
