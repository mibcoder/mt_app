import 'package:get_it/get_it.dart';
import 'package:mt_app/features/customers/presentation/bloc/customer_bloc.dart';
import 'package:mt_app/features/onboard/presentation/bloc/register_bloc.dart';

import 'features/onboard/data/datasource/app_database.dart';
import 'features/onboard/data/datasource/customers_service.dart';
import 'features/onboard/domain/repositories/customer_repository.dart';

final GetIt myServiceLocator = GetIt.instance;

Future<void> init() async {

  //*********************Blocs**************************
  myServiceLocator.registerFactory(
        () => RegisterBloc(customerRepository: myServiceLocator()),
  );
  myServiceLocator.registerFactory(
        () => CustomerBloc(customerRepository: myServiceLocator()),
  );

  //*********************Repositories**************************
  myServiceLocator.registerLazySingleton<CustomerRepository>(
        () => CustomerRepositoryImpl(customersService: myServiceLocator())
  );

  //*********************Data sources**************************
  myServiceLocator.registerLazySingleton<CustomersService>(
        () => CustomersService(appDatabase: myServiceLocator()),
  );

  //!*********************Database**************************
  myServiceLocator.registerLazySingleton(() => AppDatabase());

}