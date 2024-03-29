import 'package:flutter/material.dart';
import 'package:managing_queue/Utils/constants.dart';

class User {
  int id;
  String name, email, address, phoneNumber;
  Image? userImage;
  DateTime dateOfBirth;
  DateTime? checkInTime;
  Status userStatus = Status.notArrived;

  User(
      {required this.id,
      required this.name,
      required this.dateOfBirth,
      this.userImage,
      this.checkInTime,
      required this.phoneNumber,
      required this.email,
      required this.address,
      this.userStatus = Status.notArrived});
}
