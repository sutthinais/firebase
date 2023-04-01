import '../../../utils/functions.dart';

class LoginRequest {
  String userid;
  String password;
  String name;
  String db;
  DeviceInfo deviceInfo;

  LoginRequest({required this.userid, required this.password, required this.name, required this.db, required this.deviceInfo});
}
