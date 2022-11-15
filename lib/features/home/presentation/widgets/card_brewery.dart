import 'package:find_beer/core/models/brewery_model.dart';
import 'package:find_beer/core/style/app_color.dart';
import 'package:find_beer/core/style/app_fonts.dart';
import 'package:find_beer/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

class CardBrewery extends StatelessWidget {
  final BreweryModel brewery;
  const CardBrewery({Key? key, required this.brewery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.height(context) * 0.45,
      margin: EdgeInsets.symmetric(
          horizontal: ScreenSize.width(context) * 0.05,
          vertical: ScreenSize.height(context) * 0.01),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenSize.width(context) * 0.05,
      ),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkBrown.withOpacity(0.2),
              blurRadius: 1,
              spreadRadius: 0.1,
              offset: Offset(-2, 5),
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              brewery.image,
              height: ScreenSize.height(context) * 0.2,
            ),
          ),
          Text(
            brewery.name,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle(context).header,
          ),
          SizedBox(height: 10),
          Text(
            brewery.descripTion,
            textAlign: TextAlign.start,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle(context).textForm,
          ),
          SizedBox(height: 10),
          RichText(
            text: TextSpan(
              style: AppTextStyle(context).textForm,
              children:  <TextSpan>[
                TextSpan(text: 'Direccion:', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: brewery.address),
              ],
            ),
          )
        ],
      ),
    );
  }
}
