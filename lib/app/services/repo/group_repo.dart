import 'dart:convert';

import 'package:together/app/body/groups/model/group.dart';

//import 'package:http/http.dart' as http;

class GroupRepo {
  final String getGroupsURL = 'https://localhost:1908/todo/show/2';
  final List<Group> groups = [
    new Group('Commercials', 'local'),
    new Group('Network IT', 'local'),
    new Group('Soccer', 'local'),
    new Group('Tennis', 'local'),
    new Group('Social Engagement Altona', 'local'),
  ];

  Future getData() async {
    // http.Response response = await http.get(getGroupsURL);
    // var data = jsonDecode(response.body);
    // print(data.toString());
  }

  getGroups() {
    return this.groups;
  }

  createGroup(String name, String category){
    this.groups.add(new Group(name, category));
    print(getGroups().length);
  }
}
