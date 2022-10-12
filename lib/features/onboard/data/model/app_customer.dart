import 'package:equatable/equatable.dart';

import '../datasource/app_database.dart';


class AppCustomer extends Equatable{
   int? id;
  final String emei;
  final String firstName;
  final String lastName;
  final String dob;
  final String passport;
  final String email;
  final String imagePath;
  final String deviceName;
  final String latitude;
  final String longitude;

  Map<String, Object?> toMap() {
    final map = <String, Object?>{
      cColumnEMEI: emei,
      cColumnFirstName: firstName,
      cColumnLastName: lastName,
      cColumnDob: dob,
      cColumnPassport: passport,
      cColumnEmail: email,
      cColumnImagePath: imagePath,
      cColumnDeviceName: deviceName,
      cColumnLatitude: latitude,
      cColumnLongitude: longitude,
    };
    if (id != null) {
      map[cColumnId] = id;
    }

    return map;
  }

  AppCustomer(
      {this.id,
      required this.emei,
      required this.firstName,
        required this.lastName,
        required this.dob,
        required this.passport,
        required this.email,
        required this.imagePath,
        required this.deviceName,
        required this.latitude,
        required this.longitude,
      });

  factory AppCustomer.fromMap(Map<String, dynamic> map) {
    return AppCustomer(
      id: map[cColumnId] != null ? map[cColumnId] as int : null,
      emei: map[cColumnEMEI] != null
          ? map[cColumnEMEI] as String
          : '',
      firstName: map[cColumnFirstName] != null
          ? map[cColumnFirstName] as String
          : '',
      lastName: map[cColumnLastName] != null
          ? map[cColumnLastName] as String
          : '',
      dob: map[cColumnDob] != null
          ? map[cColumnDob] as String
          : '',
      passport: map[cColumnPassport] != null
          ? map[cColumnPassport] as String
          : '',
      email: map[cColumnEmail] != null
          ? map[cColumnEmail] as String
          : '',
      imagePath: map[cColumnImagePath] != null
          ? map[cColumnImagePath] as String
          : '',
      deviceName: map[cColumnDeviceName] != null
          ? map[cColumnDeviceName] as String
          : '',
      latitude: map[cColumnLatitude] != null
          ? map[cColumnLatitude] as String
          : '',
      longitude: map[cColumnLongitude] != null
          ? map[cColumnLongitude] as String
          : '',
    );
  }


  @override
  List<Object?> get props => [id,emei,firstName,lastName,dob,passport,email,imagePath,deviceName,latitude,longitude];
}
