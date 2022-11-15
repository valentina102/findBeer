import 'package:find_beer/core/base/base_page.dart';
import 'package:find_beer/core/style/app_color.dart';
import 'package:find_beer/core/widgets/header.dart';
import 'package:find_beer/features/qr/presentation/bloc/qr_cubit.dart';
import 'package:find_beer/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPage extends BasePage<QrState, QrCubit> {
  const QrPage({Key? key}) : super(key: key);

  @override
  QrCubit createBloc(BuildContext context) => sl<QrCubit>()..initial();
  @override
  Widget buildPage(BuildContext context, state, QrCubit bloc) {
    return Scaffold(
    body: Stack(
      children: [
        const Header(title: 'Code', showIcon: true, showLogo: false),
       Center(
         child:  Container(
           padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(  color: AppColors.darkBrown,width: 15,)
          ),
           child: QrImage(
             data: "Calle 65",
             version: QrVersions.auto,
             size: 200.0,
           ),
         ),
       )
      ],
    ),
    );
  }
}
