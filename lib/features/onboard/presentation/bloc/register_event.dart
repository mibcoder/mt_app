import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class OnboardEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterEvent extends OnboardEvent {

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

  RegisterEvent({required this.emei,required this.firstName,required this.lastName,required this.dob,required this.passport,required this.email,required this.imagePath,required this.deviceName,required this.latitude,required this.longitude});


  @override
  List<Object> get props => [emei,firstName,lastName,dob,passport,email,imagePath,deviceName,latitude,longitude];

}
class ResetRegisterEvent extends OnboardEvent {
}
