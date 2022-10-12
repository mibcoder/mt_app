import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:mt_app/features/onboard/data/model/app_customer.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../data/datasource/customers_service.dart';

abstract class CustomerRepository{

  Future<Either<Failure,List<AppCustomer>>> getAllCustomers();
  Future<Either<Failure,AppCustomer>> getCustomer(int id);
  Future<Either<Failure,AppCustomer>> saveCustomer(AppCustomer appCustomer);
  Future<Either<Failure, bool>> deleteCustomer(int id);

}

class CustomerRepositoryImpl implements CustomerRepository{

  CustomersService customersService;
  CustomerRepositoryImpl({required this.customersService});

  @override
  Future<Either<Failure, List<AppCustomer>>> getAllCustomers() async{
    try {
      final List<AppCustomer> response = await customersService.findAll();
      if(response==null){
        return Left(NotFound());
      }else{
        return Right(response);
      }
    } on ServerException {
      return Left(ServerFailure());
    } on TimeoutException {
      return Left(RequestTimeOutFailure());
    } on Exception{
      return Left(UnexpectedFailure());
    }
  }
  @override
  Future<Either<Failure, AppCustomer>> getCustomer(int id) async{
    try {
      final AppCustomer? response = await customersService.findById(id);
      if(response==null){
        return Left(NotFound());
      }else{
        return Right(response);
      }
    } on ServerException {
      return Left(ServerFailure());
    } on TimeoutException {
      return Left(RequestTimeOutFailure());
    } on Exception{
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, AppCustomer>> saveCustomer(AppCustomer appCustomer) async{
    try {
      final AppCustomer response = await customersService.insert(appCustomer);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    } on TimeoutException {
      return Left(RequestTimeOutFailure());
    } on Exception{
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteCustomer(int id) async{
    try {
      final int response = await customersService.delete(id);
      if(response==1){
        return Right(true);
      }else{
        return Right(false);
      }
    } on ServerException {
      return Left(ServerFailure());
    } on TimeoutException {
      return Left(RequestTimeOutFailure());
    } on Exception{
      return Left(UnexpectedFailure());
    }
  }

}