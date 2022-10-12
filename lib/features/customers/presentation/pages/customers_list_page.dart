import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mt_app/features/customers/presentation/bloc/customer_bloc.dart';
import 'package:mt_app/features/customers/presentation/bloc/customer_state.dart';
import 'package:mt_app/features/onboard/data/model/app_customer.dart';

import '../bloc/customer_event.dart';

class CustomersListPage extends StatefulWidget {
  const CustomersListPage({Key? key}) : super(key: key);

  @override
  State<CustomersListPage> createState() => _CustomersListPageState();
}

class _CustomersListPageState extends State<CustomersListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CustomerBloc>(context).add(LoadCustomersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customers'),
      ),
      body: _registerBody(),
    );
  }

  Widget _registerBody() {
    return BlocBuilder<CustomerBloc, CustomerState>(
        builder: (BuildContext context, CustomerState state) {
      if (state is Loaded) {
        Loaded<List<AppCustomer>> loaded = state as Loaded<List<AppCustomer>>;
        List<AppCustomer> list = loaded.response;
        if (list.isNotEmpty) {
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              AppCustomer appCustomer = list[index];
              return Container(
                padding: const EdgeInsets.all(8.0),
                height: 150,
                child: Material(
                  elevation: 1,
                  child: Row(
                    children: [
                      Image.file(
                        File(appCustomer.imagePath),
                        height: 150,
                        width: 130,
                        fit: BoxFit.fitWidth,
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(FontAwesomeIcons.user,color: Colors.blue,size: 15,),
                                Text(' ${appCustomer.firstName} ${appCustomer.lastName}'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(FontAwesomeIcons.simCard,color: Colors.blue,size: 15,),
                                Text(' ${appCustomer.emei}'),
                              ],
                            ),
                            if(appCustomer.email.isNotEmpty)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(FontAwesomeIcons.envelope,color: Colors.blue,size: 15,),
                                Text(' ${appCustomer.email}'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(FontAwesomeIcons.calendar,color: Colors.blue,size: 15,),
                                Text(' ${appCustomer.dob}'),
                              ],
                            ),
                            if(appCustomer.passport.isNotEmpty)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(FontAwesomeIcons.passport,color: Colors.blue,size: 15,),
                                Text(' ${appCustomer.passport}'),
                              ],
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(
            child: Text('No customer registered'),
          );
        }
      } else {
        return const Center(
          child: Text('Loading'),
        );
      }
    });
  }
}
