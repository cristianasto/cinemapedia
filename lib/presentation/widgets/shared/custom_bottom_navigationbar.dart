

import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      elevation: 0,
      unselectedItemColor: const Color.fromARGB(255, 153, 153, 153),
      selectedIconTheme: const IconThemeData(color: Colors.amber),
      selectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Inicio',
          activeIcon: Icon(Icons.home)
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: 'Categoria',
          activeIcon: Icon(Icons.label)
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favoritos',
          activeIcon: Icon(Icons.favorite)
        ),

      ]
    );
  }
}