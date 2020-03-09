import 'package:flutter/material.dart';
import 'package:together/app/services/repo/group_repo.dart';

import 'group_list_view.dart';

class GroupsView extends StatefulWidget {
  const GroupsView({
    Key key,
    @required this.groupRepo,
  }) : super(key: key);

  final GroupRepo groupRepo;

  @override
  State<StatefulWidget> createState() => UserViewState();
}

class UserViewState extends State<GroupsView> {
  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      myController.dispose();
      super.dispose();
    }

    List<Widget> groupViewWidgets = [];

    groupViewWidgets.add(
      TextField(
        keyboardType: TextInputType.text,
        decoration: new InputDecoration(labelText: 'Create new group'),
        controller: myController,
      ),
    );

    groupViewWidgets.add(
      FloatingActionButton(
        onPressed: () => createNewGroup(myController.text),
        tooltip: 'Create',
        child: Icon(Icons.add),
        backgroundColor: Colors.white,
        foregroundColor: Colors.deepOrangeAccent,
      ),
    );

    widget.groupRepo.getGroups().forEach(
          (group) => groupViewWidgets.add(
                GroupListView(
                  group: group,
                ),
              ),
        );

    return Container(
      margin: const EdgeInsets.all(4),
      child: ListView(
        children: groupViewWidgets,
      ),
    );
  }

  createNewGroup(String name) {
    setState(() {
      widget.groupRepo.createGroup(name, 'own');
    });
  }
}
