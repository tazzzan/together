import 'package:flutter/material.dart';

import 'body/groups/groups_view.dart';
import 'body/user/user_view.dart';
import 'bottom/together_app_bottom_navigation_bar.dart';
import 'services/repo/group_repo.dart';

class TogetherAppHome extends StatefulWidget {
  final String appTitle = 'APP';

  @override
  _TogetherAppHomeState createState() => _TogetherAppHomeState();
}

class _TogetherAppHomeState extends State<TogetherAppHome> {
  GroupRepo groupRepo = new GroupRepo();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _availableWidgets = <Widget>[
      GroupsView(groupRepo: groupRepo),
      UserView(groupRepo: groupRepo),
    ];
  
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appTitle),
      ),
      body: _availableWidgets.elementAt(
        _selectedIndex,
      ),
      bottomNavigationBar: TogetherAppBottomNavigationBar(
        f: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
