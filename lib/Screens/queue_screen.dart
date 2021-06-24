import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:managing_queue/Models/user.dart';
import 'package:managing_queue/Utils/constants.dart';

class QueueScreen extends StatefulWidget {
  const QueueScreen({Key? key}) : super(key: key);

  @override
  _QueueScreenState createState() => _QueueScreenState();
}

class _QueueScreenState extends State<QueueScreen> {
  Icon customIcon = Icon(Icons.search);
  Widget customSearchBar = Text('Doctor\'s Office');

  Widget getSearchAppBar() {
    return Padding(
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
                ),
              );
            } else {
              this.customIcon = Icon(Icons.search);
              this.customSearchBar = Text('Doctor\'s Office');
            }
          });
        },
      ),
    );
  }

  List<Widget> getListOfItemsByStatus(Status status) {

    List<User> currentUserList = [];
    for (User i in userList) {
      if (i.userStatus == status) {
        currentUserList.add(i);
      }
    }
    return getCardFromUserList(currentUserList);
  }


  List<Card> getCardFromUserList(List<User> list){
    int i = 1;
    return list.map((e) {
      i++;
      return Card(
        child: ListTile(
          dense: true,
          tileColor: i % 2 == 0 ? Colors.blue[50] : Colors.white,
          leading: Icon(
            Icons.account_circle,
            size: 40.0,
          ),
          title: Text(e.name.toUpperCase()),
          //subtitle: Text(e.email),
          trailing: Text('${DateTime.now().hour}:${DateTime.now().minute}'),
        ),
      );
    }).toList();
  }


  @override
  Widget build(BuildContext context) {
    List<String> statusHeaders = [
      'Not Arrived',
      'Arrived',
      'Called to Enter',
      'In Facility',
      'Completed'
    ];

    //List<Widget> listOfItems =

    return Scaffold(
      appBar: AppBar(
        title: customSearchBar,
        actions: [getSearchAppBar()],
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: statusHeaders.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Colors.grey,
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      Status.values[index].toString(),
                      style: TextStyle(fontSize: 23.0, color: Colors.white),
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
    );
  }
}
//listOfItems
