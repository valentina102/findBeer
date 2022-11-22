import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:find_beer/core/navigation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  StreamSubscription? gpsServiceSubscription;
  MapCubit() : super(MapState.initial());

  void initial() async {
    await getCurrentPosition();
    createMarker();
  }

  Future getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    emit(
      state.copyWith(
        knowLocation: LatLng(
          position.latitude,
          position.longitude,
        ),
      ),
    );
  }

  void createMarker() {
    var market = state.markers;
    market!.add(Marker(
      markerId: const MarkerId("1"),
      position: const LatLng(4.647486468297911, -74.05666947670723),
      onTap: () => AppNavigator.push(Routes.CREATEBOOKING),
      infoWindow: const InfoWindow(
        title: 'My Custom Title ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    ));
    emit(state.copyWith(markers: market));
  }

  void onFocusBrewery(bool focused) async {
    emit(state.copyWith(isFocusBrewery: focused));
  }

  void onFocusDate(bool focused) async {
    emit(state.copyWith(isFocusDate: focused));
  }

  void onFocusAmount(bool focused) async {
    emit(state.copyWith(isFocusAmount: focused));
  }
}
