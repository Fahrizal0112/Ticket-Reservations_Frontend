import 'package:flutter/material.dart';
import 'package:uts/cinemapage.dart';
import 'package:uts/movie.dart';

class Material3BottomNav extends StatefulWidget {
  const Material3BottomNav({super.key});

  @override
  State<Material3BottomNav> createState() => _Material3BottomNavState();
}

class _Material3BottomNavState extends State<Material3BottomNav> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 231, 221),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          Movie(), 
          CinemaPage(),
          Placeholder(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: _navBarItems,
        backgroundColor: const Color.fromARGB(255, 222, 231, 221),
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
      ),
    );
  }
}

const _navBarItems = [
  NavigationDestination(
    icon: Icon(Icons.movie_creation_outlined),
    selectedIcon: Icon(Icons.movie_creation_rounded),
    label:'Movie',
  ),
  NavigationDestination(
    icon: Icon(Icons.bookmark_border_outlined),
    selectedIcon: Icon(Icons.bookmark_rounded),
    label: 'Cinema',
  ),
  // NavigationDestination(
  //   icon: Icon(Icons.shopping_bag_outlined),
  //   selectedIcon: Icon(Icons.shopping_bag),
  //   label: 'Ticket',
  // ),
];