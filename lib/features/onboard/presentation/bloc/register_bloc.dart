
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_app/features/onboard/data/model/app_customer.dart';
import '../../domain/repositories/customer_repository.dart';

import '../../../../../core/error/failures.dart';

import 'register_state.dart';
import 'register_event.dart';

class RegisterBloc extends Bloc<OnboardEvent, RegisterState> {

  final CustomerRepository customerRepository;
  RegisterBloc({required this.customerRepository}) : super(Empty())
  {
    on<RegisterEvent>(_register);
    on<ResetRegisterEvent>(_resetRegister);

  }

  _register(RegisterEvent event, Emitter<RegisterState> emit)async{
    emit(Loading());
    final Either<Failure, AppCustomer> failureOrAppUser = await customerRepository.saveCustomer(AppCustomer(emei: event.emei, firstName: event.firstName, lastName: event.lastName, dob: event.dob, passport: event.passport, email: event.email, imagePath: event.imagePath, deviceName: event.deviceName, latitude: event.latitude, longitude: event.longitude));
    failureOrAppUser.fold(
          (failure) => emit(Error(message: 'Registration failed')),
          (appCustomer) => emit(Loaded<AppCustomer>(response: appCustomer)),
    );
  }

  _resetRegister(ResetRegisterEvent event, Emitter<RegisterState> emit)async{
    emit(Empty());
  }

}
