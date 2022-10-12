import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mt_app/core/extensions/str_extensions.dart';
import 'package:mt_app/core/util/app_const.dart';
import 'package:mt_app/core/util/app_theme.dart';
import 'package:mt_app/features/customers/presentation/pages/customers_list_page.dart';
import 'package:mt_app/features/onboard/presentation/bloc/register_event.dart';
import 'package:mt_app/features/onboard/presentation/widgets/circular_image.dart';

import '../../../../core/util/app_util.dart';
import '../../../../core/widgets/app_dialog.dart';
import '../../../../core/widgets/date_picker.dart';
import '../../../../injection_container.dart';
import '../bloc/register_bloc.dart';
import '../bloc/register_state.dart';
import '../widgets/main_button.dart';


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emeiController = TextEditingController();
  final TextEditingController passportController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String? imagePath;
  String deviceName='';
  AppLocation? appLocation;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _pageBindingDone());
  }

  Future<void> _pageBindingDone()async{

    emeiController.text = await AppUtil.getEmeiNo();
    deviceName = await AppUtil.getDeviceName();
    appLocation = await  AppUtil.currentLocationWithPermission();
    debugPrint('appLocation: ${appLocation.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registration'),actions: [IconButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomersListPage()),);
      }, icon: const Icon(FontAwesomeIcons.list,color: Colors.white,))],),
      body: BlocProvider(
          create: (_) => myServiceLocator<RegisterBloc>(),
          child: _registerBody()
      ),
    );
  }

  Widget _registerBody(){
    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          color: Colors.transparent,
          margin: const EdgeInsets.only(top: 40,right: 30,left: 30),
          constraints: const BoxConstraints( maxWidth: 400),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CircularImage(
                      size: 120,
                      onImage: (String imagePath){
                      debugPrint('imagePath: $imagePath');
                      this.imagePath=imagePath;
                    },),
                    const SizedBox(height: 30,),
                    TextFormField(
                      controller: emeiController,
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter EMEI';
                        }else if(!value.isValidEMEI){
                          return 'Enter valid EMEI';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      decoration:  InputDecoration(
                        prefixIcon:  Container(
                            alignment: Alignment.center,
                            width: 20,
                            child: Icon(FontAwesomeIcons.simCard,color: Colors.grey.withOpacity(0.3),size: 20,)
                        ),
                        counterText: "",
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'EMEI',
                        // labelText: 'Name',
                        border:  AppTheme.outlineInputBorder,
                        enabledBorder: AppTheme.outlineInputBorder,
                        disabledBorder: AppTheme.outlineInputBorder,
                        focusedBorder: AppTheme.outlineInputBorder,
                        errorBorder: AppTheme.outlineInputBorder,
                        focusedErrorBorder: AppTheme.outlineInputBorder,
                      ),
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: firstNameController,
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter first name';
                        }else if(!value.isValidName){
                          return 'Enter valid name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      decoration:  InputDecoration(
                        prefixIcon:  Container(
                            alignment: Alignment.center,
                            width: 20,
                            child: Icon(FontAwesomeIcons.user,color: Colors.grey.withOpacity(0.3),size: 20,)
                        ),
                        counterText: "",
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'First name',
                        // labelText: 'Name',
                        border:  AppTheme.outlineInputBorder,
                        enabledBorder: AppTheme.outlineInputBorder,
                        disabledBorder: AppTheme.outlineInputBorder,
                        focusedBorder: AppTheme.outlineInputBorder,
                        errorBorder: AppTheme.outlineInputBorder,
                        focusedErrorBorder: AppTheme.outlineInputBorder,
                      ),
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: lastNameController,
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter last name';
                        }else if(!value.isValidName){
                          return 'Enter valid name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      decoration:  InputDecoration(
                        prefixIcon:  Container(
                            alignment: Alignment.center,
                            width: 20,
                            child: Icon(FontAwesomeIcons.user,color: Colors.grey.withOpacity(0.3),size: 20,)
                        ),
                        counterText: "",
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Last name',
                        // labelText: 'Name',
                        border:  AppTheme.outlineInputBorder,
                        enabledBorder: AppTheme.outlineInputBorder,
                        disabledBorder: AppTheme.outlineInputBorder,
                        focusedBorder: AppTheme.outlineInputBorder,
                        errorBorder: AppTheme.outlineInputBorder,
                        focusedErrorBorder: AppTheme.outlineInputBorder,
                      ),
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: dobController,
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Select DOB';
                        }
                        return null;
                      },
                      onTap: (){
                        FocusManager.instance.primaryFocus?.unfocus();

                        AppDialog.appSimpleDialog(
                            buildContext: context,
                            builder: (BuildContext buildContext) {

                              return DatePicker(onClose: () {
                                Navigator.of(context).pop();
                                FocusManager.instance.primaryFocus?.unfocus();
                                if(dobController.text.isEmpty){
                                  dobController.text= DateFormat(AppConst.dateFormat).format(DateTime.now());
                                }
                              }, onDateTimeChanged: (selectedDate) {
                                dobController.text= DateFormat(AppConst.dateFormat).format(selectedDate);
                                setState(() {

                                });
                              },);
                            });
                      },
                      keyboardType: TextInputType.none,
                      decoration:  InputDecoration(
                        prefixIcon:  Container(
                            alignment: Alignment.center,
                            width: 20,
                            child: Icon(FontAwesomeIcons.calendar,color: Colors.grey.withOpacity(0.3),size: 20,)
                        ),
                        counterText: "",
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'DOB',
                        // labelText: 'Name',
                        border:  AppTheme.outlineInputBorder,
                        enabledBorder: AppTheme.outlineInputBorder,
                        disabledBorder: AppTheme.outlineInputBorder,
                        focusedBorder: AppTheme.outlineInputBorder,
                        errorBorder: AppTheme.outlineInputBorder,
                        focusedErrorBorder: AppTheme.outlineInputBorder,
                      ),
                    ),
                    if(dobController.text.isNotEmpty && DateFormat(AppConst.dateFormat).parse(dobController.text).isBefore(DateTime(DateTime.now().year-18)))
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: TextFormField(
                        controller: passportController,
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter passport';
                          }else if(!value.isValidPassport){
                            return 'Enter valid passport';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        decoration:  InputDecoration(
                          prefixIcon:  Container(
                              alignment: Alignment.center,
                              width: 20,
                              child: Icon(FontAwesomeIcons.passport,color: Colors.grey.withOpacity(0.3),size: 20,)
                          ),
                          counterText: "",
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Passport',
                          // labelText: 'Name',
                          border:  AppTheme.outlineInputBorder,
                          enabledBorder: AppTheme.outlineInputBorder,
                          disabledBorder: AppTheme.outlineInputBorder,
                          focusedBorder: AppTheme.outlineInputBorder,
                          errorBorder: AppTheme.outlineInputBorder,
                          focusedErrorBorder: AppTheme.outlineInputBorder,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: emailController,
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return null;
                        }else if(!value.isValidEmail){
                          return 'Enter valid name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      decoration:  InputDecoration(
                        prefixIcon:  Container(
                            alignment: Alignment.center,
                            width: 20,
                            child: Icon(FontAwesomeIcons.envelope,color: Colors.grey.withOpacity(0.3),size: 20,)
                        ),
                        counterText: "",
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Email',
                        // labelText: 'Name',
                        border:  AppTheme.outlineInputBorder,
                        enabledBorder: AppTheme.outlineInputBorder,
                        disabledBorder: AppTheme.outlineInputBorder,
                        focusedBorder: AppTheme.outlineInputBorder,
                        errorBorder: AppTheme.outlineInputBorder,
                        focusedErrorBorder: AppTheme.outlineInputBorder,
                      ),
                    ),
                    const SizedBox(height: 30,),
                    _saveBtn(),
                    const SizedBox(height: 50,),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  _saveBtn() {
    return BlocConsumer<RegisterBloc, RegisterState>(
        listener: (BuildContext context, RegisterState state){
          if(state is Loaded){
            AppDialog.showSnackBar(context, content: 'Registered successfully');
            _formKey.currentState!.reset();
            firstNameController.text='';
            lastNameController.text='';
            dobController.text='';
            passportController.text='';
            emailController.text='';
            _pageBindingDone();
            BlocProvider.of<RegisterBloc>(context).add(ResetRegisterEvent());
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomersListPage()),);
          }
        },
        builder: (BuildContext context, RegisterState state) {

          return Column(
            children: [
              if(state is Error)
                Align(alignment:Alignment.centerLeft,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(state.message,style: const TextStyle(color: Colors.red),),
                )),
              MainButton(
                loading: state is Loading,
                child: Text('Save',style: Theme.of(context).textTheme.button!.copyWith(fontWeight: FontWeight.bold,fontSize: 17.0,color: Colors.white),),
                onTap: ()async{

                  FocusManager.instance.primaryFocus?.unfocus();

                  if(imagePath==null){
                    AppDialog.showSnackBar(context, content: 'Please take photo');
                  }else if(appLocation == null) {
                    AppDialog.showSnackBar(context, content: 'Location is not provided');
                    appLocation = await  AppUtil.currentLocationWithPermission();
                  }else if(state is Empty || state is Error){
                    if (_formKey.currentState!.validate() && imagePath!=null) {
                      BlocProvider.of<RegisterBloc>(context).add(RegisterEvent(emei: emeiController.text, firstName: firstNameController.text, lastName: lastNameController.text, dob: dobController.text, passport: passportController.text, email: emailController.text, imagePath: imagePath!, deviceName: deviceName, latitude: '${appLocation?.lat??'0'}', longitude: '${appLocation?.log??'0'}'));
                    }
                  }
                },
              ),
            ],
          );
        }
    );
  }
}
