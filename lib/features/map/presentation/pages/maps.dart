import 'package:find_beer/core/base/base_page.dart';
import 'package:find_beer/features/map/presentation/bloc/map/map_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../injection_container.dart';

class MapsPage extends BasePage<MapState, MapCubit> {
  const MapsPage({Key? key}) : super(key: key);

  @override
  MapCubit createBloc(BuildContext context) => sl<MapCubit>()..initial();

  @override
  Widget buildPage(BuildContext context, MapState state, MapCubit bloc) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Future.delayed(const Duration(milliseconds: 500), () {
          state.completer.future.then(
                (value) => value.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: state.knowLocation!,
                  zoom: 14.4746,
                ),
              ),
            ),
          );
        });
      },
    );
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: state.knowLocation!,
          zoom: 14.4746,
        ),
        onMapCreated: (controller) {

          state.completer.complete(controller);
        },
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        markers: state.markers!,
      ),
    );
  }
}
