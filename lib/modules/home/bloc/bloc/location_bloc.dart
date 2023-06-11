import 'package:bloc/bloc.dart';
import 'package:location/location.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final Location location;
  LocationBloc(this.location) : super(LocationInitial()) {
    on<RequestLocation>((event, emit) {
      Stream getCurrenLocation() async* {
        try {
          final locationData = await location.getLocation();
          yield LocationUpdated(locationData);
        } catch (e) {
          print('Failed to get location: $e');
          yield LocationInitial();
        }
      }
    });
  }
}
