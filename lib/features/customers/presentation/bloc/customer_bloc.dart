
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../onboard/data/model/app_customer.dart';
import '../../../onboard/domain/repositories/customer_repository.dart';

import '../../../../../core/error/failures.dart';

import 'customer_event.dart';
import 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {

  final CustomerRepository customerRepository;
  CustomerBloc({required this.customerRepository}) : super(Empty())
  {
    on<LoadCustomersEvent>(_loadAll);
  }


  _loadAll(LoadCustomersEvent event, Emitter<CustomerState> emit)async{
    emit(Loading());
    final Either<Failure, List<AppCustomer>> failureOrAppUser = await customerRepository.getAllCustomers();
    failureOrAppUser.fold(
          (failure) => emit(Error(message: 'No data found')),
          (appCustomers) => emit(Loaded<List<AppCustomer>>(response: appCustomers)),
    );
  }

}
