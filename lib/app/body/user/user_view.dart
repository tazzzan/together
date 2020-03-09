import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:together/app/body/groups/model/group.dart';
import 'package:together/app/body/groups/model/group_info.dart';
import 'package:together/app/services/repo/group_repo.dart';

class UserView extends StatefulWidget {
  const UserView({Key key, @required this.groupRepo}) : super(key: key);

  final GroupRepo groupRepo;

  @override
  UserViewState createState() => UserViewState();
}

class UserViewState extends State<UserView> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    widget.groupRepo
        .getGroups()
        .forEach((group) => count = count + group.interestScore);

    return Column(
      children: getUserWidgets(),
    );
  }

  List<Widget> getUserWidgets() {
    List<Widget> userWidgets = [];

    userWidgets.add(
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(0),
            child: IconButton(
              icon: (count > 0 ? Icon(Icons.star) : Icon(Icons.star_border)),
              color: Colors.red[500],
              onPressed: () =>
                  Provider.of<GroupInfo>(context, listen: false).increment(),
            ),
          ),
          SizedBox(
            width: 18,
            child: Container(
              child: Text(count.toString()),
            ),
          ),
        ],
      ),
    );

    var groups = widget.groupRepo.getGroups();
    groups
        .sort((Group a, Group b) => b.interestScore.compareTo(a.interestScore));
    groups.forEach((group) => userWidgets.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    child:
                        Text('You are interested in ' + group.name + ' by: '),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(group.interestScore.toString()),
                  )
                ],
              )
            ],
          ),
        ));

    return userWidgets;
  }
}
