part of 'location_bloc.dart';
 class LocationState {}

// Location initial state
class LocationInitial extends LocationState {}

// Location updated state
class LocationUpdated extends LocationState {
  final LocationData locationData;

  LocationUpdated(this.locationData);
}