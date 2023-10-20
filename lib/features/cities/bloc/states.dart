
import '../cities.dart';

class CitiesStates {}

class CitiesLoadingState extends CitiesStates {}

class CitiesSuccessState extends CitiesStates {
  final List<CityModel> list;

  CitiesSuccessState({required this.list});
}

class CitiesFailedState extends CitiesStates {}
