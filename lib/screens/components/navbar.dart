import 'package:flutter/material.dart';

class MyBottomBar extends StatelessWidget {
  final int index;
  final Function(int?) onTap;
  const MyBottomBar({super.key, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: onTap,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey[300],
      backgroundColor: Colors.transparent,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline,
                color: Color.fromARGB(255, 255, 255, 255)),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline,
                color: Color.fromARGB(255, 255, 255, 255)),
            label: 'Home'),
        BottomNavigationBarItem(
            icon:
                Icon(Icons.settings, color: Color.fromARGB(255, 255, 255, 255)),
            label: 'Home')
      ],
    );
  }
}
