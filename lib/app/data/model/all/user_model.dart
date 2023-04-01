import 'package:getx_home_service/app/data/model/all/list_item_model.dart';
import 'package:getx_home_service/app/utils/app_prefs.dart';

class UserInfo {
  UserInfo({required this.fullName, required this.userId, required this.userGroup, required this.userGroupName, required this.token, required this.branchList, required this.privateToken, required this.version, required this.selectBranch, required this.db});

  String? fullName;
  String? userId;
  String? userGroup;
  String? userGroupName;
  String? token;
  List<BranchList>? branchList;
  String? privateToken;
  String? version;
  BranchList selectBranch;
  ListItem db;
  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        fullName: json["fullName"] ?? "",
        userId: json["userId"],
        userGroup: json["userGroup"],
        userGroupName: json["userGroupName"],
        token: json["token"],
        branchList: json["branchList"] == null ? [] : List<BranchList>.from(json["branchList"]!.map((x) => BranchList.fromJson(x))),
        privateToken: json["privateToken"],
        version: json["version"],
        selectBranch: json["selectBranch"] ?? BranchList(branchCode: EMPTY, branchname: EMPTY),
        db: json["db"] ?? ListItem(value: EMPTY, name: EMPTY),
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "userId": userId,
        "userGroup": userGroup,
        "userGroupName": userGroupName,
        "token": token,
        "branchList": branchList == null ? [] : List<dynamic>.from(branchList!.map((x) => x.toJson())),
        "privateToken": privateToken,
        "version": version,
        "selectBranch": selectBranch.toJson(),
        "db": db.toJson()
      };

  UserInfo copyWith({
    String? fullName,
    String? userId,
    String? userGroup,
    String? userGroupName,
    String? token,
    List<BranchList>? branchList,
    String? privateToken,
    String? version,
    BranchList? selectBranch,
    ListItem? db,
  }) =>
      UserInfo(
          fullName: fullName ?? this.fullName,
          userId: userId ?? this.userId,
          userGroup: userGroup ?? this.userGroup,
          userGroupName: userGroupName ?? this.userGroupName,
          token: token ?? this.token,
          branchList: branchList ?? this.branchList,
          privateToken: privateToken ?? this.privateToken,
          version: version ?? this.version,
          selectBranch: selectBranch ?? this.selectBranch,
          db: db ?? this.db);
}

class BranchList {
  BranchList({
    required this.branchCode,
    required this.branchname,
  });

  String branchCode;
  String branchname;

  factory BranchList.fromJson(Map<String, dynamic> json) => BranchList(
        branchCode: json["branchCode"] ?? "",
        branchname: json["branchname"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "branchCode": branchCode,
        "branchname": branchname,
      };

  BranchList copyWith({
    String? branchCode,
    String? branchname,
  }) =>
      BranchList(
        branchCode: branchCode ?? this.branchCode,
        branchname: branchname ?? this.branchname,
      );
}
