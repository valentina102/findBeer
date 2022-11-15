import 'package:bloc/bloc.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationState.initial());

  void initial(
    int indexPage,
  ) {
    emit(state.copyWith(currentIndex: indexPage));
  }

  void changeIndex(int index) async {
    emit(state.copyWith(currentIndex: index));
  }
}
