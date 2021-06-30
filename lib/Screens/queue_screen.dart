import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:managing_queue/Models/user.dart';
import 'package:managing_queue/Utils/constants.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'user_profile.dart';
import 'package:url_launcher/url_launcher.dart';

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

  @override
  Widget build(BuildContext context) {
    List<Widget> getCardFromUserList(List<User> list) {
      int i = -1;
      return list.map((e) {
        i++;
        return Slidable(
          key: Key(e.id.toString()),
          actionPane: SlidableScrollActionPane(),
          actions: <Widget>[
            IconSlideAction(
              caption: 'Move UP',
              color: Colors.green[200],
              icon: Icons.keyboard_arrow_up,
              onTap: () {
                setState(() {
                  //listOfUsersToBeRendered.removeWhere((element) => element.name == e.name);
                  // User removedUser = listOfUsersToBeRendered.removeAt(i);
                  // Status removedStatus = removedUser.userStatus;
                  // removedUser.userStatus = Status.inFacility;
                  print('FROM: ${listOfUsersToBeRendered[i].userStatus}');
                  listOfUsersToBeRendered[i].userStatus =
                      getNextStatus(listOfUsersToBeRendered[i].userStatus);
                  print('TO: ${listOfUsersToBeRendered[i].userStatus}');
                });
              },
            )
          ],
          // onDismissed: (DismissDirection d) {},
          // background: Container(
          //   child: Text(
          //     'Change status',
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   color: Colors.green[300],
          //   alignment: Alignment.centerRight,
          // ),
          child: Card(
            child: ListTile(
              dense: true,
              tileColor: i % 2 == 0 ? Colors.blue[50] : Colors.white,
              leading: Icon(
                Icons.account_circle,
                size: 40.0,
              ),
              title: Text(e.name.toUpperCase()),
              trailing: Text('${DateTime.now().hour}:${DateTime.now().minute}'),
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Container(
                    color: Colors.blue[100],
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: [
                        Text(e.name.toUpperCase()),
                        SizedBox(height: 8.0),
                        Text(e.email),
                        SizedBox(height: 8.0),
                        Text(e.phoneNumber)
                      ],
                    ),
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserProfile(
                                  name: e.name,
                                  phone: e.phoneNumber,
                                  email: e.email,
                                  dob: e.dateOfBirth,
                                  address: e.address,
                                ),
                              ),
                            );
                          },
                          child: Text('View Person details')),
                      TextButton(
                        onPressed: () {},
                        child: Text('Move Person'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          launch('tel:${e.phoneNumber}');
                        },
                        child: Text('Call Person'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            userList
                                .removeWhere((element) => element.id == e.id);
                            filteredUserList
                                .removeWhere((element) => element.id == e.id);
                            listOfUsersToBeRendered
                                .removeWhere((element) => element.id == e.id);
                          });
                        },
                        child: Text('Delete Person'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList();
    }

    List<Widget> getListOfItemsByStatus(Status status) {
      List<User> currentUserList = [];
      for (User i in listOfUsersToBeRendered) {
        if (i.userStatus == status) {
          currentUserList.add(i);
        }
      }
      return getCardFromUserList(currentUserList);
    }

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
                      if (buttonArrivedStyle == kInactiveButtonStyle) {
                        buttonArrivedStyle = kActiveButtonStyle;
                        buttonFacilityStyle = kInactiveButtonStyle;
                        buttonCalledStyle = kInactiveButtonStyle;

                        filteredUserList = userList
                            .where((element) =>
                                element.userStatus == Status.arrived)
                            .toList();
                      } else {
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
                      if (buttonCalledStyle == kInactiveButtonStyle) {
                        buttonCalledStyle = kActiveButtonStyle;
                        buttonFacilityStyle = kInactiveButtonStyle;
                        buttonArrivedStyle = kInactiveButtonStyle;

                        filteredUserList = userList
                            .where((element) =>
                                element.userStatus == Status.calledToEnter)
                            .toList();
                      } else {
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
                      if (buttonFacilityStyle == kInactiveButtonStyle) {
                        buttonFacilityStyle = kActiveButtonStyle;
                        buttonCalledStyle = kInactiveButtonStyle;
                        buttonArrivedStyle = kInactiveButtonStyle;

                        filteredUserList = userList
                            .where((element) =>
                                element.userStatus == Status.inFacility)
                            .toList();
                      } else {
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
          Flexible(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: statusHeaders.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        color: Colors.grey,
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            //Status.values[index].toString(),
                            statusHeaders[index],
                            style:
                                TextStyle(fontSize: 23.0, color: Colors.white),
                          ),
                        ),
                      ),
                      ListView(
                        shrinkWrap: true,
                        children: getListOfItemsByStatus(Status.values[index]),
                        physics: ClampingScrollPhysics(),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

  Status getNextStatus(Status userStatus) {
    if (userStatus == Status.notArrived) {
      return Status.arrived;
    } else if (userStatus == Status.arrived) {
      return Status.calledToEnter;
    } else if (userStatus == Status.calledToEnter) {
      return Status.inFacility;
    } else if (userStatus == Status.inFacility) {
      return Status.completed;
    } else if (userStatus == Status.completed) {
      return Status.notArrived;
    } else
      return Status.completed;
  }
}
