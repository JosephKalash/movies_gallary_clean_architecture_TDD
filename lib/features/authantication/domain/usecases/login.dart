import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class Login {
  final AuthRepository _authRepo;

  Login(this._authRepo);

  // Future<Either<Failure, User>> call(String username,String password) async {
  // }
}
