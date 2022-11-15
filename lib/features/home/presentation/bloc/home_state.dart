part of 'home_cubit.dart';

class HomeState {
  HomeState({required this.breweryList});

  List<BreweryModel> breweryList;
  factory HomeState.initial() => HomeState(
        breweryList: [
          BreweryModel.fromJsonNotData(),
          BreweryModel.fromJsonNotData(),
          BreweryModel.fromJsonNotData(),
        ],
      );

  HomeState copyWith({List<BreweryModel>? breweryList}) {
    return HomeState(breweryList: breweryList ?? this.breweryList);
  }
}
