import 'package:flutter/material.dart';
import 'package:together/app/body/groups/model/group.dart';

class GroupListView extends StatefulWidget {
  const GroupListView({
    Key key,
    @required this.group,
  }) : super(key: key);

  final Group group;

  @override
  _GroupListViewState createState() => _GroupListViewState();
}

class _GroupListViewState extends State<GroupListView> {
  @override
  Widget build(BuildContext context) {
    final Group group = widget.group;

    return Container(
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.deepOrange[400],
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(group.name),
              Text(group.category),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: getIcon(group),
                color: Colors.black26,
                onPressed: () => feautureGroup(group),
              ),
              Text(group.interestScore.toString())
            ],
          ),
        ],
      ),
    );
  }

  feautureGroup(Group group) {
    setState(() {
      group.feature();
    });
  }

  getIcon(Group group) {
    if (group.interestScore > 0) {
      return Icon(Icons.star);
    }

    return Icon(Icons.star_half);
  }

}
