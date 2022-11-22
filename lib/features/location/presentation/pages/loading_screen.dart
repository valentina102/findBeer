import 'package:find_beer/features/map/presentation/pages/maps.dart';
import 'package:flutter/material.dart';
import 'package:find_beer/injection_container.dart';
import 'package:find_beer/core/base/base_page.dart';
import 'package:find_beer/features/map/presentation/widgets/request_location.dart';
import 'package:find_beer/features/location/presentation/bloc/location/location_cubit.dart';

class LoadingScreen extends BasePage<LocationState, LocationCubit> {

  const LoadingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildPage(
      BuildContext context, LocationState state, LocationCubit bloc) {
    return state.isGpsPermissionGranted
        ? MapsPage()
        : RequestLocation(askGpsAccess: bloc.askGpsAccess);
  }

  @override
  LocationCubit createBloc(BuildContext context) => sl<LocationCubit>()..init();
}
