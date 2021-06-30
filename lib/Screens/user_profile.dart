import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile(
      {Key? key,
      required this.name,
      required this.email,
      required this.phone,
      required this.dob,
      required this.address})
      : super(key: key);

  final String name, email, phone, address;
  final DateTime dob;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor\'s office'),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                child: Icon(
                  Icons.account_circle,
                  size: 140.0,
                ),
                radius: 70.0,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 45.0),
              ),
              Text(
                'DOB: ${dob.day}/${dob.month}/${dob.year}',
                style: TextStyle(fontSize: 25.0),
              ),
              Text(
                'Email: $email',
                style: TextStyle(fontSize: 25.0),
              ),
              Text(
                'Phone: $phone',
                style: TextStyle(fontSize: 25.0),
              ),
              Text(
                'Address: $address',
                style: TextStyle(fontSize: 25.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
