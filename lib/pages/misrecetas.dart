import 'package:flutter/material.dart';
import 'favoritos.dart';
import 'buscar.dart';
import 'perfil.dart';
import 'my_home_page.dart';

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
      appBar: AppBar(
        title: Text('Mis Recetas'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
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
      body: ListView.builder(
        itemCount: myRecipes.length,
        itemBuilder: (context, index) {
          final recipe = myRecipes[index];
          return Card(
            margin: EdgeInsets.all(10),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Image.network(
                  recipe['imageUrl']!,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe['title']!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        recipe['description']!,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Acción al presionar "Ver Detalles"
                      },
                      child: Text('VER DETALLES'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
