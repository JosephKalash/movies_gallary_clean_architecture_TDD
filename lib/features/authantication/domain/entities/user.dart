import 'package:equatable/equatable.dart';

class User extends Equatable {
  final _userId;
  final _token;
  final _expositTime;

  User(
    this._userId,
    this._token,
    this._expositTime,
  );


  @override
  List<Object?> get props => [
        _userId,
        _token,
        _expositTime,
      ];
}
