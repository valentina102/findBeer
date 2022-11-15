part of 'bottom_navigation_cubit.dart';

class BottomNavigationState {
  BottomNavigationState({
    required this.currentIndex,
  });

  final int currentIndex;
  factory BottomNavigationState.initial() => BottomNavigationState(
        currentIndex: 2,
      );

  BottomNavigationState copyWith({
    int? currentIndex,
  }) {
    return BottomNavigationState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
