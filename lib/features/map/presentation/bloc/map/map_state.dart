part of 'map_cubit.dart';

class MapState {
  MapState({
    required this.completer,
    required this.knowLocation,
    required this.markers,
    required this.keyForm,
    required this.breweryController,
    required this.isFocusBrewery,
    required this.dateController,
    required this.isFocusDate,
    required this.amountController,
    required this.isFocusAmount,
  });

  final Completer<GoogleMapController> completer;
  final LatLng? knowLocation;
  final Set<Marker>? markers;
  final GlobalKey<FormState> keyForm;
  final TextEditingController breweryController;
  final bool isFocusBrewery;
  final TextEditingController dateController;
  final bool isFocusDate;
  final TextEditingController amountController;
  final bool isFocusAmount;

  factory MapState.initial() => MapState(
        keyForm: GlobalKey<FormState>(),
        completer: Completer(),
        knowLocation: const LatLng(0, 0),
        markers: new Set(),
        breweryController:
            TextEditingController(text: 'Cervecería Lateral Calle 65'),
        isFocusBrewery: false,
        dateController: TextEditingController(
            text:DateFormat.yMd().format(DateTime.now())
                .toString()),
        isFocusDate: false,
    amountController:
    TextEditingController(),
    isFocusAmount: false,
      );

  MapState copyWith({
    GlobalKey<FormState>? keyForm,
    LatLng? knowLocation,
    Set<Marker>? markers,
    Completer<GoogleMapController>? completer,
    TextEditingController? breweryController,
    bool? isFocusBrewery,
    TextEditingController? dateController,
    bool? isFocusDate,
    TextEditingController? amountController,
    bool? isFocusAmount,
  }) =>
      MapState(
        completer: completer ?? this.completer,
        knowLocation: knowLocation ?? this.knowLocation,
        markers: markers ?? this.markers,
        keyForm: keyForm ?? this.keyForm,
        breweryController: breweryController ?? this.breweryController,
        isFocusBrewery: isFocusBrewery ?? this.isFocusBrewery,
        dateController: dateController ?? this.dateController,
        isFocusDate: isFocusDate ?? this.isFocusDate,
        amountController: amountController ?? this.amountController,
        isFocusAmount: isFocusAmount ?? this.isFocusAmount,
      );
}
