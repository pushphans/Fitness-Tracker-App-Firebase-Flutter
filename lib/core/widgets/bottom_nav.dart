import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fitness_tracker_app_firebase/presentation/pages/home_page.dart';
import 'package:fitness_tracker_app_firebase/presentation/pages/profile.dart';
import 'package:fitness_tracker_app_firebase/presentation/pages/workout.dart';
import 'package:flutter/material.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int selectedIndex = 0;

  List<Widget> pages = [const HomePage(), const Workout(), const Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,

      body: pages[selectedIndex],

      bottomNavigationBar: CurvedNavigationBar(
        index: selectedIndex,
        buttonBackgroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        color: Colors.black,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        items: [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.fitness_center, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
        ],
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
