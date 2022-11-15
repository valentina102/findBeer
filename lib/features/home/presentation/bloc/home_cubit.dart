import 'package:bloc/bloc.dart';
import 'package:find_beer/core/models/brewery_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  void initial() {
  }
}
