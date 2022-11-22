import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  StreamSubscription? gpsServiceSubscription;

  LocationCubit() : super(LocationState.initial());

  Future<void> _gpsPermission(
    bool isGpsEnable,
    bool isGpsPermissionGranted,
  ) async {
    emit(
      state.copyWith(
        isGpsEnable: isGpsEnable,
        isGpsPermissionGranted: isGpsPermissionGranted,
      ),
    );
  }

  Future<void> init() async {
    var grant = await _isPermissionGranted();
    if (!grant) askGpsAccess();
    final gpsInitStatus = await Future.wait([
      _checkGpsStatus(),
      _isPermissionGranted(),
    ]);
    await _gpsPermission(gpsInitStatus[0], gpsInitStatus[1]);
  }

  Future<void> askGpsAccess() async {
    final status = await Permission.location.request();

    switch (status) {
      case PermissionStatus.granted:
        _gpsPermission(state.isGpsEnable, true);
        break;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
        _gpsPermission(state.isGpsEnable, false);
        openAppSettings();
        break;
    }
  }

  Future<bool> _checkGpsStatus() async {
    final isEnable = await Geolocator.isLocationServiceEnabled();

    gpsServiceSubscription =
        Geolocator.getServiceStatusStream().listen((event) {
      final isEnabled = (event.index == 1) ? true : false;
      _gpsPermission(isEnabled, state.isGpsPermissionGranted);
    });
    return isEnable;
  }

  Future<bool> _isPermissionGranted() async {
    final isGranted = await Permission.location.isGranted;
    return isGranted;
  }

  @override
  Future<void> close() {
    gpsServiceSubscription?.cancel();
    return super.close();
  }
}
