import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/exception.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/location.dart';
import 'package:taxi_go_user_version/Features/Map/Controller/mapState.dart';
import 'package:taxi_go_user_version/Features/Map/Data/Repo/mapRepo.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/placesModel/directions/leg.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/placesModel/geocode_adress/result.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/placesModel/place_details/location.dart';
import 'package:taxi_go_user_version/Features/Map/Data/model/placesModel/place_search/prediction.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class MapsCubit extends Cubit<MapsState> {
  final MapRepo mapsRepository;
  // for map intialization
  late GoogleMapController mapController;

  // for origin & destination
  GeocodeResult originAddress = GeocodeResult();
  GeocodeResult destinationAddress = GeocodeResult();
  Leg distanceTime = Leg();
  late Marker orignMarker;
  late Marker destinationMarker;
  late CameraPosition placeCameraPosition;
  LocationPosition? orginPosition;
  late LocationPosition destinationostion;
  Timer? _debounce;
  LocationService locationService = LocationService();
  late String destinationInfo;

  // these variables for getPlaceLocation
  Set<Marker> markers = {};
  Set<Polyline> polyLines = {};
  late Prediction placeSuggestion;
  List<Prediction> predictions = [];
  MapsCubit({required this.mapsRepository}) : super(MapsInitial());

  /// get user location
  Future<void> getUserLocation({required String title}) async {
    try {
      emit(PlaceAddressLoading());
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
    } on PermissionException catch (error) {
      Fluttertoast.showToast(msg: error.message);
      emit(OpenLoacationFailed());
    }
  }

  /// start updating user location
  getUserUpdatedLocation({required String title}) async {
    await locationService.updateUserLocation((LocationData userlocation) {
      try {
        emit(PlaceAddressLoading());
        debugPrint(userlocation.toString());
        orginPosition = LocationPosition(
          lat: userlocation.latitude,
          lng: userlocation.longitude,
        );
        emit(UpdateOriginLocatoin());
        buildmarker(
          title: title,
          destinationInfo: title,
          postion: LatLng(orginPosition!.lat!, orginPosition!.lng!),
        );

        updatePlaceCameraPosition(
          place: LatLng(
            userlocation.latitude!,
            userlocation.longitude!,
          ),
        );
      } on PermissionException catch (error) {
        Fluttertoast.showToast(msg: error.message);
        emit(OpenLoacationFailed());
      }
    });
  }

  /// get place suggestions
  Future<void> emitPlaceSuggestions({
    required String searchQuery,
    required String sessionToken,
    required BuildContext context,
  }) async {
    _debounce?.cancel();
    emit(PlacesLoading());
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      final response = await mapsRepository.fetchSuggestions(
        context: context,
        searchQuery: searchQuery,
        sessionToken: sessionToken,
      );
      response.fold(
        (error) => emit(PlacesFailLoaded(message: error.message)),
        (onSuccess) {
          predictions.clear();
          predictions.addAll(onSuccess.predictions ?? []);
          emit(PlacesLoaded(predictions));
        },
      );
    });
  }

  /// get place Address form Loaction
  Future<void> emitPlaceAddress({
    required LatLng placeLatLng,
    required String sessionToken,
    required bool isorigin,
    required BuildContext context,
  }) async {
    emit(PlaceAddressLoading());
    final res = await mapsRepository.getPlaceAddress(
        placeLatLng: placeLatLng, sessionToken: sessionToken, context: context);
    res.fold((error) => emit(GetAddressFail(message: error.message)),
        (onsuccess) {
      isorigin
          ? originAddress = onsuccess.results![0]
          : destinationAddress = onsuccess.results![0];
      emit(GetAddressSuccess());
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
  Future<void> emitPlaceDirections({
    required LatLng origin,
    required LatLng destination,
    required String sessionToken,
    required BuildContext context,
  }) async {
    emit(PlaceDirectionsLading());
    final response = await mapsRepository.getDrirection(
        origin: origin,
        destination: destination,
        sessionToken: sessionToken,
        context: context);
    response.fold((onError) {}, (onSuccess) {
      distanceTime = onSuccess.routes!.first.legs!.first;
      emit(LegsLoaded(leg: distanceTime));
      buildmarker(
        title: 'des',
        destinationInfo: 'des',
        postion: LatLng(destination.latitude, destination.longitude),
      );
      updatePlaceCameraPosition(place: destination, zoom: 10);
      drawPolyline(origin: origin, destination: destination);
      emit(DirectionsLoaded(polyLines));
    });
  }

  /// Draw polyline between origin and destination
  void drawPolyline({
    required LatLng origin,
    required LatLng destination,
  }) async {
    try {
      emit(DrawPolyinesLoading());
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
        width: 5,
        polylineId: const PolylineId('route'),
        points:
            result.points.map((e) => LatLng(e.latitude, e.longitude)).toList(),
      ));
      emit(DrawPolyinesSuccess());
    } catch (e) {
      emit(DrawPolyinesFailure(message: e.toString()));
    }
  }

  /// update place camera position for a place
  void updatePlaceCameraPosition(
      {required LatLng place, double zoom = 13}) async {
    placeCameraPosition = CameraPosition(
      bearing: 0.0,
      target: LatLng(place.latitude, place.longitude),
      tilt: 0.0,
      zoom: zoom,
    );

    final GoogleMapController controller = mapController;
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
  Future<void> riderequest({
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
    response.fold(
        (onError) => emit(CheckPromocodeFail(message: onError.message)),
        (onSuccess) => emit(CheckPromocodeSuccess()));
  }

  /// calculate price for ride from source to destination
  Future<void> calculatePrice(
      {required BuildContext context,
      required int time,
      required String distance,
      required int triptype,
      required LatLng origin,
      required LatLng destination}) async {
    emit(CalculatePriceLoading());
    final response = await mapsRepository.calculatePrice(
        context: context,
        time: time,
        distance: distance,
        triptype: triptype,
        origin: origin,
        destination: destination);

    response.fold((onError) => emit(CalculatePriceFail()), (onSuccess) {
      emit(CalculatePriceSuccess());
    });
  }

  Future<void> getRideRequest({required BuildContext context}) async {
    emit(GetActiveRideRequestLoading());
    final response = await mapsRepository.getActiveRide(context: context);
    response.fold(
        (onError) => emit(GetActiveRideRequestFail(message: onError.message)),
        (onSuccess) {
      emit(GetActiveRideRequestSuccess());
    });
  }
}

class GetActiveRideRequestSuccess extends MapsState {}

class GetActiveRideRequestFail extends MapsState {
  final String message;
  GetActiveRideRequestFail({required this.message});
}

class GetActiveRideRequestLoading extends MapsState {}
