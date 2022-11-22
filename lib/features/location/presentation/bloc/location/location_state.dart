part of 'location_cubit.dart';

class LocationState {
  final bool isGpsEnable;
  final bool isGpsPermissionGranted;

  bool get isAllGranted => (isGpsEnable && isGpsPermissionGranted);

  LocationState({
    required this.isGpsEnable,
    required this.isGpsPermissionGranted,
  });

  factory LocationState.initial() => LocationState(
        isGpsEnable: false,
        isGpsPermissionGranted: false,
      );

  LocationState copyWith({bool? isGpsEnable, bool? isGpsPermissionGranted}) =>
      LocationState(
        isGpsEnable: isGpsEnable ?? this.isGpsEnable,
        isGpsPermissionGranted:
            isGpsPermissionGranted ?? this.isGpsPermissionGranted,
      );
}
