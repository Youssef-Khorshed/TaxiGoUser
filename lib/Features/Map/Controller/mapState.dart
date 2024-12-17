import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/placesModel/place_details/location.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/placesModel/place_search/prediction.dart';

abstract class MapsState {}

class MapsInitial extends MapsState {}

class MapsInitialized extends MapsState {}

class UpdatePlaceCameraPosition extends MapsState {}

class UpdateMarkers extends MapsState {}

class UpdateOriginLocatoin extends MapsState {}

class UpdateDestinationLocatoin extends MapsState {}

class PlacesLoading extends MapsState {}

class PlacesLoaded extends MapsState {
  final List<Prediction> places;

  PlacesLoaded(this.places);
}

class CancelRideLoading extends MapsState {}

class CancelRideFail extends MapsState {}

class CancelRideSuccess extends MapsState {}

class CalculatePriceLoading extends MapsState {}

class CalculatePriceFail extends MapsState {}

class CalculatePriceSuccess extends MapsState {}

class CheckPromocodeSuccess extends MapsState {}

class CheckPromocodeFail extends MapsState {}

class CheckPromocodeLoading extends MapsState {}

class RideRequestLoading extends MapsState {}

class RideRequestFail extends MapsState {}

class RideRequestSuccess extends MapsState {}

class PlacesFailLoaded extends MapsState {
  String message;
  PlacesFailLoaded({required this.message});
}

class GetSearchedPlace extends MapsState {
  final LocationPosition geometry;

  GetSearchedPlace(this.geometry);
}

class DirectionsLoaded extends MapsState {
  Set<Polyline> polylines;
  DirectionsLoaded(this.polylines);
}
