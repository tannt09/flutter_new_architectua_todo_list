import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/view/count/count.dart';
import 'package:flutter_new_architectua/view/todo_list/todo_list.dart';
import 'package:flutter_new_architectua/view/todo_list/todo_list_products.dart';

@RoutePage()
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 1;

  static const List<Widget> _widgetOptions = <Widget>[
    Products(),
    CountPage(title: "Count Screen"),
    TodoListPage(title: "User"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.gif_box), label: "Product"),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: "Count"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "User")
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
