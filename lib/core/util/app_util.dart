import 'package:device_information/device_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class AppUtil{
  AppUtil._();

  static Future<String> getEmeiNo() async {
    try{
      Map<Permission,PermissionStatus> status = await [Permission.phone].request();
      if(status[Permission.phone] == PermissionStatus.granted){
        String imeiNo = await DeviceInformation.deviceIMEINumber;
        debugPrint('imeiNo: $imeiNo');
        return imeiNo;
      }else{
        // openAppSettings();
      }

    }catch(e){
      debugPrint('Emei Error: $e');
    }
    return '';
  }
  static Future<String> getDeviceName() async {
    try{
      String name = await DeviceInformation.deviceName;
      debugPrint('name: $name');
      return name;
    }catch(e){
      debugPrint('getDeviceName Error: $e');
    }
    return '';
  }
  static Future<AppLocation> currentLocationWithPermission() async {

    // Check if location services(GPS) are enabled.
    bool gpsServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!gpsServiceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.

      //This is will request to turn-on GPS
      await Geolocator.openLocationSettings();
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {

      //To request to user, so that user can allow to access location
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.


        //open app setting, so that user can allow to access location
        await Geolocator.openAppSettings();
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.

      //open app setting, so that user can allow to access location
      await Geolocator.openAppSettings();
    }

    if(gpsServiceEnabled &&
        (permission == LocationPermission.always || permission == LocationPermission.whileInUse)) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return AppLocation(lat: position.latitude,log: position.longitude,permission: gpsServiceEnabled);
    }

    return AppLocation(permission: gpsServiceEnabled &&
        (permission == LocationPermission.always || permission == LocationPermission.whileInUse));
  }

}

class AppLocation{
  double? lat;
  double? log;
  bool permission;

  AppLocation({this.lat, this.log,required this.permission});

  @override
  String toString() {
    return 'AppLocation{lat: $lat, log: $log, permission: $permission}';
  }
}