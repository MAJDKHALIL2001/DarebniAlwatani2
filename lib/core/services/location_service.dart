import 'package:bot_toast/bot_toast.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:location/location.dart';
import 'package:darrebni_exam/ui/shared/utils.dart';

class LocationService {
  Location location = new Location();

  Future<LocationData?> getCurrentLocation({bool? showLoader = true}) async {
    LocationData _locationData;

    if (!await isServiceEnabled()) return null;

    if (!await isPermissionGranted()) return null;

    if (showLoader!) customLoader();

    _locationData = await location.getLocation();

    BotToast.closeAllLoading();

    return _locationData;
  }

  Future<geo.Placemark> getLocationInfo(LocationData locationData) async {
    List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
        locationData.latitude ?? 0.0, locationData.longitude ?? 0.0);

    return placemarks.first;
  }

  Future<bool> isPermissionGranted() async {
    PermissionStatus _permissionGranted;

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }

    return true;
  }

  Future<bool> isServiceEnabled() async {
    bool _serviceEnabled;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return false;
      }
    }

    return true;
  }
}
