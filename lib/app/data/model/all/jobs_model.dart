// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:getx_home_service/app/themes/app_colors.dart';

enum JobStatus {
  INIT_STATUS,
  WAIT_STATUS,
  ASSIGN_STATUS,
  PAYED_STATUS,
}

class Jobs {
  final int docCode;
  final String name;
  final DateTime createDate;
  final JobStatus status;
  final String customerName;
  final String phoneCustomer;
  final String addressCustomer;
  final String servicesName;
  final String servicesCode;
  final String teamCode;
  final String teamName;

  Jobs({
    required this.docCode,
    required this.name,
    required this.createDate,
    required this.status,
    required this.customerName,
    required this.phoneCustomer,
    required this.addressCustomer,
    required this.servicesName,
    required this.servicesCode,
    required this.teamCode,
    required this.teamName,
  });

  String enumToString() {
    switch (status) {
      case JobStatus.INIT_STATUS:
        return "ปกติ";
      case JobStatus.WAIT_STATUS:
        return "รอทำใบเสนอราคา";
      case JobStatus.ASSIGN_STATUS:
        return "ได้รับมอบหมาย";
      case JobStatus.PAYED_STATUS:
        return "จ่ายเงินให้ช่างแล้ว";
    }
  }

  Color enumToColor() {
    switch (status) {
      case JobStatus.INIT_STATUS:
        return AppColors.black;
      case JobStatus.WAIT_STATUS:
        return AppColors.red;
      case JobStatus.ASSIGN_STATUS:
        return AppColors.colorAssign;
      case JobStatus.PAYED_STATUS:
        return AppColors.green;
    }
  }

  factory Jobs.fromJson(Map<String, dynamic> json) {
    return Jobs(
      docCode: json['docCode'],
      name: json['name'],
      createDate: DateTime.parse(json['createDate']),
      status: JobStatus.values[json['status']],
      customerName: json['customerName'],
      phoneCustomer: json['phoneCustomer'],
      addressCustomer: json['addressCustomer'],
      servicesName: json['servicesName'],
      servicesCode: json['servicesCode'],
      teamCode: json['teamCode'],
      teamName: json['teamName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'docCode': docCode,
      'name': name,
      'createDate': createDate.toIso8601String(),
      'status': status.index,
      'customerName': customerName,
      'phoneCustomer': phoneCustomer,
      'addressCustomer': addressCustomer,
      'servicesName': servicesName,
      'servicesCode': servicesCode,
      'teamCode': teamCode,
      'teamName': teamName,
    };
  }

  Jobs copyWith({
    int? docCode,
    String? name,
    DateTime? createDate,
    JobStatus? status,
    String? customerName,
    String? phoneCustomer,
    String? addressCustomer,
    String? servicesName,
    String? servicesCode,
    String? teamCode,
    String? teamName,
  }) {
    return Jobs(
      docCode: docCode ?? this.docCode,
      name: name ?? this.name,
      createDate: createDate ?? this.createDate,
      status: status ?? this.status,
      customerName: customerName ?? this.customerName,
      phoneCustomer: phoneCustomer ?? this.phoneCustomer,
      addressCustomer: addressCustomer ?? this.addressCustomer,
      servicesName: servicesName ?? this.servicesName,
      servicesCode: servicesCode ?? this.servicesCode,
      teamCode: teamCode ?? this.teamCode,
      teamName: teamName ?? this.teamName,
    );
  }
}
