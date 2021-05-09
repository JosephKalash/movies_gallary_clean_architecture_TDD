import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  //Future<Either<Failure, User>> login(String username,String password);
  Future<Either<Failure, User>> signin(String username,String password);
}
