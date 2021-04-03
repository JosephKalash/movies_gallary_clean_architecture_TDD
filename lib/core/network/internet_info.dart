
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class InternetInfo {
  Future<bool> get isConnect;
}

class InternetInfoImpl implements InternetInfo {
  final InternetConnectionChecker internetConnection;

  InternetInfoImpl(this.internetConnection);

  @override
  Future<bool> get isConnect => internetConnection.hasConnection;
}
