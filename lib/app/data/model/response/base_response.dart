import '../../api/error_handler.dart';

class BaseResponseModel {
  int status;
  String message;
  String error;
  String version;
  dynamic data;

  BaseResponseModel({required this.status, required this.message, required this.error, required this.version, this.data});

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) => BaseResponseModel(
        status: json["status"] ?? ApiInternalStatus.FAILURE,
        message: json["message"] ?? ResponseMessage.DEFAULT,
        error: json["error"] ?? "",
        version: json["version"] ?? "0",
        data: json["data"],
      );
}
