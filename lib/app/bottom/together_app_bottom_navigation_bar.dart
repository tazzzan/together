import 'package:flutter/material.dart';

class TogetherAppBottomNavigationBar extends StatelessWidget {

  const TogetherAppBottomNavigationBar({
    Key key,
    @required this.f,
    @required this.selectedIndex,
  }) : super(key: key);

  final int selectedIndex;
  final Function f;

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      currentIndex: selectedIndex,
      items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(
            Icons.home,
            size: 30,
          ),
          title: Text(
            "Home",
            style: TextStyle(fontSize: 30),
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(
            Icons.assignment_ind,
            size: 30,
          ),
          title: Text(
            "User",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ],
      onTap: (newIndex) {
        f(newIndex);
      },
    );
  }

}
