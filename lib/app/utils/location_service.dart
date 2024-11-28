import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  static Future<Map<String, dynamic>> getCurrentLocation({bool isOnInit = false}) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return {"Status Lokasi": "Layanan lokasi atau GPS dinonaktifkan."};
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return {"Status Lokasi": "Izin lokasi ditolak."};
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return {"Status Lokasi": "Izin lokasi ditolak secara permanen."};
    }

    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    if (isOnInit) {
      return {};
    }
    return getAddressFromLatLng(latitude: position.latitude, longitude: position.longitude);
  }

  static Future<Map<String, dynamic>> getAddressFromLatLng({required double latitude, required double longitude}) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks[0];
      final result = {
        "Jalan": place.street,
        "Kode Negara": place.isoCountryCode,
        "Negara": place.country,
        "Kode Pos": place.postalCode,
        "Provinsi": place.administrativeArea,
        "Kabupaten/Kota": place.subAdministrativeArea,
        "Kecamatan": place.locality,
        "Kelurahan": place.subLocality,
        "Latitude": latitude,
        "Longitude": longitude,
      };
      return result;
    } catch (e) {
      return {
        "Status Lokasi": "Tidak dapat mendapatkan lokasi",
        "Latitude": latitude,
        "Longitudee": longitude,
      };
    }
  }
}
