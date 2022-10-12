import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CustomerState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends CustomerState {}

class Loading extends CustomerState {}

class Loaded<T> extends CustomerState {
  final T response;

  Loaded({required this.response});

  @override
  List<Object> get props => [];
}

class Error extends CustomerState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
