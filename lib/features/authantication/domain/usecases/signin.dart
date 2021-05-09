
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class Signin{
  final AuthRepository _authRepo;

  Signin(this._authRepo);

  Future<Either<Failure, User>> call(String username,String password) async {
    return  _authRepo.signin(username,password);
  }
}