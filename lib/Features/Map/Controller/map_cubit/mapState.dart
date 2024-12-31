import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/get_active_ride/get_active_ride.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/get_last_ride/get_last_ride.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/placesModel/directions/leg.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/placesModel/place_details/location.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/placesModel/place_search/prediction.dart';

abstract class MapsState {}

class MapsInitial extends MapsState {}

class MapsInitialized extends MapsState {}

class UpdatePlaceCameraPosition extends MapsState {}

class UpdateMarkers extends MapsState {}

class UpdateOriginLocatoin extends MapsState {}

class UpdateCaptinLocatoin extends MapsState {}

class UpdateDestinationLocatoin extends MapsState {}

class GetActiveRideRequestSuccess extends MapsState {
  GetActiveRide activeRide;
  GetActiveRideRequestSuccess({required this.activeRide});
}

class ClearMarkerPolyines extends MapsState {}

class GetActiveRideRequestFail extends MapsState {
  final String message;
  GetActiveRideRequestFail({required this.message});
}

class TimerisClosedSuccess extends MapsState {}

class GetActiveRideRequestNoTrips extends MapsState {}

class GetActiveRideRequestLoading extends MapsState {}

class PlacesLoading extends MapsState {}

class OpenLoacationFailed extends MapsState {}

class PlacesLoaded extends MapsState {
  final List<Prediction> places;

  PlacesLoaded(this.places);
}

class DrawPolyinesLoading extends MapsState {}

class DrawPolyinesSuccess extends MapsState {}

class DrawPolyinesFailure extends MapsState {
  String message;

  DrawPolyinesFailure({required this.message});
}

class CancelRideLoading extends MapsState {}

class ConvertToAddressSuccess extends MapsState {}

class CancelRideFail extends MapsState {}

class CancelRideSuccess extends MapsState {}

class CalculatePriceLoading extends MapsState {}

class CalculatePriceFail extends MapsState {}

class CalculatePriceSuccess extends MapsState {}

class CheckPromocodeSuccess extends MapsState {}

class CheckPromocodeFail extends MapsState {
  String message;
  CheckPromocodeFail({required this.message});
}

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

class LegsLoaded extends MapsState {
  Leg leg;
  LegsLoaded({required this.leg});
}

class UpdateBoundsPosition extends MapsState {}

class PlaceDirectionsLading extends MapsState {}

class PlaceDirectionsFaild extends MapsState {}

class Accepted extends MapsState {}

class GetAddressLoading extends MapsState {}

class TripStarted extends MapsState {
  bool tripStarted;
  TripStarted({required this.tripStarted});
}

class TripFinished extends MapsState {}

class GetLastRideLoading extends MapsState {}

class GetLastRideSuccess extends MapsState {
  GetLastRide getLastRideSuccess;
  GetLastRideSuccess({required this.getLastRideSuccess});
}

class GetLastRideFailure extends MapsState {
  String message;
  GetLastRideFailure({required this.message});
}

class ArrivedToCustomer extends MapsState {
  bool arrivedtoCustomer;
  ArrivedToCustomer({required this.arrivedtoCustomer});
}

class GetAddressSuccess extends MapsState {}

class PlaceAddressLoading extends MapsState {}

class GetAddressFail extends MapsState {
  String message;
  GetAddressFail({required this.message});
}
