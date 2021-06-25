import 'package:flutter/material.dart';
import 'package:managing_queue/Models/user.dart';
import 'package:managing_queue/Utils/constants.dart';

class RenderListFromUsers extends StatelessWidget {
  const RenderListFromUsers({Key? key, required this.listOfUsersToBeRendered}) : super(key: key);

  final List<User> listOfUsersToBeRendered;


  @override
  Widget build(BuildContext context) {

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
            trailing: Text('${DateTime.now().hour}:${DateTime.now().minute}'),
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
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
                    TextButton(onPressed: (){}, child: Text('View Person details')),
                    TextButton(onPressed: (){}, child: Text('Move Person')),
                    TextButton(onPressed: (){}, child: Text('Call Person')),
                    TextButton(onPressed: (){}, child: Text('Delete Person')),
                  ],
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

    return Flexible(
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

