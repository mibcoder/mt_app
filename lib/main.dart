import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_app/features/customers/presentation/bloc/customer_bloc.dart';

import 'core/util/simple_bloc_observer.dart';
import 'features/onboard/presentation/pages/splash_page.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  if (kDebugMode) {
    Bloc.observer = SimpleBlocObserver();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CustomerBloc>(
            create: (_) => myServiceLocator<CustomerBloc>()
        ),
      ],
      child: MaterialApp(
        title: 'MT Test App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashPage(),
      ),
    );
  }
}

