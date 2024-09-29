import 'package:flutter/material.dart';
import 'favoritos.dart';
import 'buscar.dart';
import 'perfil.dart';
import 'my_home_page.dart';
import 'package:cafemixes/main.dart';

class MyRecipesScreen extends StatelessWidget {
  // Lista de recetas de ejemplo para la pantalla de "Mis Recetas"
  final List<Map<String, String>> myRecipes = [
    {
      'title': 'Café Espresso',
      'description': 'Un café espresso fuerte y aromático',
      'imageUrl': 'https://example.com/espresso.jpg',
    },
    {
      'title': 'Capuchino',
      'description': 'Café con leche y espuma',
      'imageUrl': 'https://example.com/capuchino.jpg',
    },
  ];

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(128, 64, 0, 0),
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () {
                {
                  
                Navigator.pop(context);
              };
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Perfil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserProfileScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Buscar'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favoritos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> FavoritesScreen()),
                ); // Cierra el Drawer
              },
            ),
          ],
        ),
      ),
      
    );
    
  }
}
