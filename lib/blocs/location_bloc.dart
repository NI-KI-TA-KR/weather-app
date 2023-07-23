import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:location/location.dart';
import 'package:weather_app/constants/location.dart';
import 'package:weather_app/models/latlng.dart';

class LocationBloc extends BlocBase{
  LocationBloc(){
    fetchLocation();
  }

  late LatLng latLng;
  final _initializationCompleter = Completer<void>();
  Future<void> get onInitializationComplete => _initializationCompleter.future;

  fetchLocation() async {
    Location location = Location();
    final result = await location.getLocation();
    latLng = LatLng(lat: result.latitude ?? latKyiv, lng: result.longitude ?? lngKyiv);
    notifyListeners();
    _initializationCompleter.complete();

    location.onLocationChanged.listen((newLocation) {
      latLng = LatLng(lat: newLocation.latitude ?? latKyiv, lng: newLocation.longitude ?? lngKyiv);
    });
  }
}