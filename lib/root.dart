import 'package:flutter/material.dart';
import 'package:kuis_mobile_124240063/screens/home.dart';
import 'package:kuis_mobile_124240063/screens/profile.dart';

class Root extends StatefulWidget {
  const new({super.key, required String username});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeScreen(),
      ProfileScreen(username: AutofillHints.username),
    ];

    return Scaffold(
      appBar: AppBar(title: Text("")),

      body: screens[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
