import 'package:equatable/equatable.dart';

abstract class Failure implements Equatable{
   @override
  List<Object> get props => [];
}

class ServerFailure extends Failure{
  @override
  bool? get stringify => false;
}