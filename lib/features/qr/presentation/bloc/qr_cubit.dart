import 'package:bloc/bloc.dart';

part 'qr_state.dart';

class QrCubit extends Cubit<QrState> {
  QrCubit() : super(QrState.initial());

 void initial(){}
}
