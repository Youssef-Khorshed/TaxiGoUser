import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/location.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/mapState.dart';
import 'package:taxi_go_user_version/Features/Map/Data/Repo/mapRepo.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/placesModel/place_details/location.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/placesModel/place_search/prediction.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class MapsCubit extends Cubit<MapsState> {
  final MapRepo mapsRepository;
  // for map intialization
  final Completer<GoogleMapController> mapController = Completer();

  // for origin & destination
  late Marker orignMarker;
  late Marker destinationMarker;
  late CameraPosition placeCameraPosition;
  LocationPosition? orginPosition;
  late LocationPosition destinationostion;
  LocationService locationService = LocationService();
  late String destinationInfo;

  // these variables for getPlaceLocation
  Set<Marker> markers = {};
  Set<Polyline> polyLines = {};
  late Prediction placeSuggestion;
  List<Prediction> predictions = [];
  MapsCubit({required this.mapsRepository}) : super(MapsInitial());

  /// get user location
  getUserLocation({required String title}) async {
    final userLocation = await locationService.getuserLocation();
    orginPosition = LocationPosition(
      lat: userLocation.latitude,
      lng: userLocation.longitude,
    );
    emit(UpdateOriginLocatoin());
    buildmarker(
      title: title,
      destinationInfo: title,
      postion: LatLng(orginPosition!.lat!, orginPosition!.lng!),
    );
    updatePlaceCameraPosition(
        place: LatLng(userLocation.latitude!, userLocation.longitude!));
  }

  /// start updating user location
  getUserUpdatedLocation({required String title}) async {
    return await locationService
        .updateUserLocation((LocationData userlocation) {
      emit(UpdateOriginLocatoin());
      buildmarker(
        title: title,
        destinationInfo: title,
        postion: LatLng(orginPosition!.lat!, orginPosition!.lng!),
      );
      updatePlaceCameraPosition(
          place: LatLng(userlocation.latitude!, userlocation.longitude!));
    });
  }

  /// map initialization
  Future<void> initMap() async {
    placeCameraPosition = const CameraPosition(
        target: LatLng(33.40302561069593, 44.498105563683005), zoom: 8);
    emit(MapsInitialized());
  }

  /// get place suggestions
  Future<void> emitPlaceSuggestions(
      {required String searchQuery,
      required String sessionToken,
      required BuildContext context}) async {
    emit(PlacesLoading());

    Timer(const Duration(seconds: 2), () async {
      emit(PlacesLoading());
      predictions.clear();
      final response = await mapsRepository.fetchSuggestions(
          context: context,
          searchQuery: searchQuery,
          sessionToken: sessionToken);
      response
          .fold((onError) => emit(PlacesFailLoaded(message: onError.message)),
              (onSuccess) {
        predictions = onSuccess.predictions!;
        emit(PlacesLoaded(predictions));
      });
    });
  }

  /// get place details location
  Future<void> emitPlaceLocation(
      {required String placeId,
      required String sessionToken,
      required BuildContext context}) async {
    emit(PlacesLoading());
    final response = await mapsRepository.getPlaceLocation(
        context: context, placeId: placeId, sessionToken: sessionToken);
    response.fold((onError) {}, (onSuccess) {
      destinationostion = onSuccess.result!.geometry!.location!;
      emit(GetSearchedPlace(onSuccess.result!.geometry!.location!));
    });
  }

  /// get place directions between origin and destination
  Future<void> emitPlaceDirections(LatLng origin, LatLng destination) async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: Constants.mapToken,
      request: PolylineRequest(
        origin: PointLatLng(orginPosition!.lat!, orginPosition!.lng!),
        destination:
            PointLatLng(destinationostion.lat!, destinationostion.lng!),
        mode: TravelMode.driving,
      ),
    );
    polyLines.clear();
    polyLines.add(Polyline(
      polylineId: const PolylineId('route'),
      points:
          result.points.map((e) => LatLng(e.latitude, e.longitude)).toList(),
    ));

    emit(DirectionsLoaded(polyLines));
  }

  /// update place camera position for a place
  void updatePlaceCameraPosition({required LatLng place}) async {
    placeCameraPosition = CameraPosition(
      bearing: 0.0,
      target: LatLng(place.latitude, place.longitude),
      tilt: 0.0,
      zoom: 13,
    );
    final GoogleMapController controller = await mapController.future;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(placeCameraPosition));

    emit(UpdatePlaceCameraPosition());
  }

  /// build markers between origin and destination
  void buildmarker({
    required String title,
    required String destinationInfo,
    required LatLng postion,
  }) {
    markers.add(Marker(
        markerId: MarkerId(title),
        position: postion,
        infoWindow: InfoWindow(title: title),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)));
    emit(UpdateMarkers());
  }

  /// cancel ride request after ride request not while in progress trip
  void canelRideRequest({required BuildContext context}) async {
    emit(CancelRideLoading());
    final response = await mapsRepository.canelRideRequest(context: context);
    response.fold((onError) => emit(CancelRideFail()),
        (onSuccess) => emit(CancelRideSuccess()));
  }

  /// add ride request
  void riderequest({
    required BuildContext context,
    required String addressFrom,
    required String latFrom,
    required String lngFrom,
    required String addressTo,
    required String latTo,
    required String lngTo,
    required int tripType,
    required String paymentMethod,
    String? promocode,
  }) async {
    emit(RideRequestLoading());
    final response = await mapsRepository.rideRequest(
        context: context,
        addressFrom: addressFrom,
        latFrom: latFrom,
        lngFrom: lngFrom,
        addressTo: addressTo,
        latTo: latTo,
        lngTo: lngTo,
        tripType: tripType,
        paymentMethod: paymentMethod);
    response.fold((onError) => emit(RideRequestFail()),
        (onSuccess) => emit(RideRequestSuccess()));
  }

  /// check promocode
  void checkPromocode(
      {required BuildContext context, required String code}) async {
    emit(CheckPromocodeLoading());
    final response =
        await mapsRepository.checkPromocode(context: context, code: code);
    response.fold((onError) => emit(CheckPromocodeFail()),
        (onSuccess) => emit(CheckPromocodeSuccess()));
  }

  /// calculate price for ride from source to destination
  void calculatePrice({required BuildContext context}) async {
    emit(CalculatePriceLoading());
    final response = await mapsRepository.calculatePrice(context: context);
    response.fold((onError) => emit(CalculatePriceFail()),
        (onSuccess) => emit(CalculatePriceSuccess()));
  }
}
