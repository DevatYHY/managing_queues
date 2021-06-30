import 'package:managing_queue/Models/user.dart';
import 'package:flutter/material.dart';

enum Status { notArrived, arrived, calledToEnter, inFacility, completed }

List<String> statusHeaders = [
  'Not Arrived',
  'Arrived',
  'Called to Enter',
  'In Facility',
  'Completed'
];

List<User> userList = [
  User(
      id: 1,
      name: "name1",
      dateOfBirth: DateTime(1993, 10, 2),
      phoneNumber: "1234567891",
      email: "email1@email.com",
      address: "block 1 street 1 block 1 street 1 block 1 street 1 block 1 street 1",
      userStatus: Status.arrived),
  User(
      id: 2,
      name: "name2",
      dateOfBirth: DateTime(1993, 10, 3),
      phoneNumber: "1234567892",
      email: "email2@email.com",
      address: "block 2 street 2",
      userStatus: Status.arrived),
  User(
      id: 3,
      name: "name3",
      dateOfBirth: DateTime(1993, 10, 4),
      phoneNumber: "1234567893",
      email: "email3@email.com",
      address: "block 3 street 3",
      userStatus: Status.calledToEnter),
  User(
      id: 4,
      name: "name4",
      dateOfBirth: DateTime(1993, 10, 5),
      phoneNumber: "1234567894",
      email: "email4@email.com",
      address: "block 4 street 4",
      userStatus: Status.notArrived),
  User(
      id: 5,
      name: "name5",
      dateOfBirth: DateTime(1993, 10, 6),
      phoneNumber: "1234567895",
      email: "email5@email.com",
      address: "block 5 street 5",
      userStatus: Status.calledToEnter),
  User(
      id: 6,
      name: "name6",
      dateOfBirth: DateTime(1993, 10, 7),
      phoneNumber: "1234567896",
      email: "email6@email.com",
      address: "block 6 street 6",
      userStatus: Status.completed),
  User(
      id: 7,
      name: "name7",
      dateOfBirth: DateTime(1993, 10, 8),
      phoneNumber: "1234567897",
      email: "email7@email.com",
      address: "block 7 street 7",
      userStatus: Status.inFacility),
  User(
      id: 8,
      name: "name8",
      dateOfBirth: DateTime(1993, 10, 9),
      phoneNumber: "1234567898",
      email: "email8@email.com",
      address: "block 8 street 8",
      userStatus: Status.inFacility),
  User(
      id: 9,
      name: "name9",
      dateOfBirth: DateTime(1993, 10, 10),
      phoneNumber: "1234567899",
      email: "email9@email.com",
      address: "block 9 street 9"),
];

var kActiveButtonStyle = OutlinedButton.styleFrom(
  backgroundColor: Colors.blue,
  primary: Colors.white,
);

var kInactiveButtonStyle = OutlinedButton.styleFrom(
  backgroundColor: Colors.white,
  primary: Colors.blue,
);

// User(name: "name10", dateOfBirth: DateTime(1993, 10, 11), phoneNumber: "1234567810", email: "email10@email.com", address: "block 10 street 10"),
// User(name: "name11", dateOfBirth: DateTime(1993, 10, 12), phoneNumber: "1234567811", email: "email11@email.com", address: "block 11 street 11"),
// User(name: "name12", dateOfBirth: DateTime(1993, 10, 13), phoneNumber: "1234567812", email: "email12@email.com", address: "block 12 street 12"),
// User(name: "name13", dateOfBirth: DateTime(1993, 10, 14), phoneNumber: "1234567813", email: "email13@email.com", address: "block 13 street 13"),
// User(name: "name14", dateOfBirth: DateTime(1993, 10, 15), phoneNumber: "1234567814", email: "email14@email.com", address: "block 14 street 14"),
// User(name: "name15", dateOfBirth: DateTime(1993, 10, 16), phoneNumber: "1234567815", email: "email15@email.com", address: "block 15 street 15"),