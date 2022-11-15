import 'package:bloc/bloc.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

part 'scanner_state.dart';

class ScannerCubit extends Cubit<ScannerState> {
  ScannerCubit() : super(ScannerState.initial());

  void initial(){}
  void scanner()async{
    var data = await FlutterBarcodeScanner.scanBarcode(
        "red", "cancel",false, ScanMode.QR);

    emit(state.copyWith(data: data));
  }
}
