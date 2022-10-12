import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class CustomerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadCustomersEvent extends CustomerEvent {}
