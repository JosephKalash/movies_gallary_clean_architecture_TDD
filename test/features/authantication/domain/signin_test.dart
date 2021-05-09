import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_gallery/features/authantication/domain/entities/user.dart';
import 'package:movies_gallery/features/authantication/domain/repositories/auth_repository.dart';
import 'package:movies_gallery/features/authantication/domain/usecases/signin.dart';

import 'signin_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  final mockRepo = MockAuthRepository();
  final signin = Signin(mockRepo);

  test(
    'should call repo.signin form mockRepo when signin usecase is called',
    () async {
      final username = 'j';
      final password = 'j';
      final date = DateTime.now();
      final user = User(
        username,
        password,
        date,
      );
      //arrange
      when(mockRepo.signin(any, any)).thenAnswer((_) async => Right(user));
      //act
      final result = await signin(username, password);
      //assert
      expect(result, Right(user));
    },
  );
}
