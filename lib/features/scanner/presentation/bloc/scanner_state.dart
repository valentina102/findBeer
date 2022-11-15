part of 'scanner_cubit.dart';

class ScannerState {
  ScannerState({
    required this.data,
});
  final String data;
  factory ScannerState.initial() => ScannerState(
      data: "",
  );

  ScannerState copyWith({ String? data,  String? qrData}) {
    return ScannerState(
      data: data ?? this.data,
    );
  }
}
