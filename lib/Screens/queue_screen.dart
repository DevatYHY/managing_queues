import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:managing_queue/Models/user.dart';
import 'package:managing_queue/Utils/constants.dart';
import 'package:managing_queue/Utils/render_list_from_users.dart';

class QueueScreen extends StatefulWidget {
  const QueueScreen({Key? key}) : super(key: key);

  @override
  _QueueScreenState createState() => _QueueScreenState();
}

class _QueueScreenState extends State<QueueScreen> {
  Icon customIcon = Icon(Icons.search);
  Widget customSearchBar = Text('Doctor\'s Office');

  List<User> listOfUsersToBeRendered = userList;
  List<User> filteredUserList = userList;

  var buttonArrivedStyle = kInactiveButtonStyle;
  var buttonCalledStyle = kInactiveButtonStyle;
  var buttonFacilityStyle = kInactiveButtonStyle;

  Widget getAlertDialog(){
    return AlertDialog(
      content: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(onPressed: (){}, child: Text('View Person details')),
            TextButton(onPressed: (){}, child: Text('Move Person')),
            TextButton(onPressed: (){}, child: Text('Call Person')),
            TextButton(onPressed: (){}, child: Text('Delete Person')),
          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    print('Build called');
    return Scaffold(
      appBar: AppBar(title: customSearchBar, actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
          child: IconButton(
            icon: customIcon,
            onPressed: () {
              setState(() {
                if (this.customIcon.icon == Icons.search) {
                  this.customIcon = Icon(Icons.close);
                  this.customSearchBar = Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    child: TextField(
                      cursorColor: Colors.white,
                      textInputAction: TextInputAction.go,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter name to search...",
                        hintStyle: TextStyle(
                          color: Colors.white70,
                          fontSize: 16.0,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                      onChanged: (s) {
                        setState(() {
                          print(s);
                          listOfUsersToBeRendered = filteredUserList
                              .where((element) => element.name
                                  .toLowerCase()
                                  .contains(s.toLowerCase()))
                              .toList();
                        }); //SEARCH
                      },
                    ),
                  );
                } else {
                  this.customIcon = Icon(Icons.search);
                  this.customSearchBar = Text('Doctor\'s Office');
                }
              });
            },
          ),
        ),
      ]),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: buttonArrivedStyle,
                  onPressed: () {
                    print(statusHeaders[1]);
                    setState(() {
                      if(buttonArrivedStyle == kInactiveButtonStyle){
                        buttonArrivedStyle = kActiveButtonStyle;
                        buttonFacilityStyle = kInactiveButtonStyle;
                        buttonCalledStyle = kInactiveButtonStyle;

                        filteredUserList = userList
                            .where(
                                (element) => element.userStatus == Status.arrived)
                            .toList();
                      }
                      else{
                        buttonArrivedStyle = kInactiveButtonStyle;
                        filteredUserList = userList;
                      }
                      listOfUsersToBeRendered = filteredUserList;
                    });
                  },
                  child: Text(statusHeaders[1]),
                ),
              ),
              Expanded(
                child: OutlinedButton(
                  style: buttonCalledStyle,
                  onPressed: () {
                    print(statusHeaders[2]);
                    setState(() {
                      if(buttonCalledStyle == kInactiveButtonStyle){
                        buttonCalledStyle = kActiveButtonStyle;
                        buttonFacilityStyle = kInactiveButtonStyle;
                        buttonArrivedStyle = kInactiveButtonStyle;

                        filteredUserList = userList
                            .where((element) =>
                        element.userStatus == Status.calledToEnter)
                            .toList();
                      }
                      else{
                        buttonCalledStyle = kInactiveButtonStyle;
                        filteredUserList = userList;
                      }
                      listOfUsersToBeRendered = filteredUserList;
                    });
                  },
                  child: Text(statusHeaders[2]),
                ),
              ),
              Expanded(
                child: OutlinedButton(
                  style: buttonFacilityStyle,
                  onPressed: () {
                    print(statusHeaders[3]);
                    setState(() {
                      if(buttonFacilityStyle == kInactiveButtonStyle){
                        buttonFacilityStyle = kActiveButtonStyle;
                        buttonCalledStyle = kInactiveButtonStyle;
                        buttonArrivedStyle = kInactiveButtonStyle;

                        filteredUserList = userList
                            .where((element) =>
                        element.userStatus == Status.inFacility)
                            .toList();
                      }
                      else{
                        buttonFacilityStyle = kInactiveButtonStyle;
                        filteredUserList = userList;
                      }
                      listOfUsersToBeRendered = filteredUserList;
                    });
                  },
                  child: Text(statusHeaders[3]),
                ),
              ),
            ],
          ),
          RenderListFromUsers(listOfUsersToBeRendered: listOfUsersToBeRendered),
        ],
      ),
    );
  }
}

