import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RegisterState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends RegisterState {}

class Loading extends RegisterState {}

class Loaded<T> extends RegisterState {
  final T response;

  Loaded({required this.response});

  @override
  List<Object> get props => [];
}

class Error extends RegisterState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
