import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'FrappeScreen.dart';
import 'LatteScreen.dart';
import 'buscar.dart';
import 'misrecetas.dart';
import 'perfil.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyFavoritesPage(),
    );
  }
}

class MyFavoritesPage extends StatefulWidget {
  @override
  _MyFavoritesPageState createState() => _MyFavoritesPageState();
}

class _MyFavoritesPageState extends State<MyFavoritesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  // Lista de recetas de ejemplo
  final List<Map<String, String>> favoriteRecipes = [
    {
      'title': 'Frappe Chocolate',
      'description': 'Frappe con sabor a chocolate',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPTtEaEnFb-Ko48_nTjuZLb86K0go1b8wcAQ&s'
    },
    {
      'title': 'Latte Vainilla',
      'description': 'Café con leche y un toque de vainilla',
      'imageUrl': 'https://osterstatic.reciperm.com/webp/10101.webp'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: SvgPicture.asset(
          'assets/icons/cafe.svg',
          width: 50,
          height: 50,
        ),
        title: Text("Mis Favoritos"),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
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
                setState(() {
                  _selectedIndex = 0;
                });
                Navigator.pop(context);
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
          ],
        ),
      ),
      body: _buildFavoritesBody(),
    );
  }

  Widget _buildFavoritesBody() {
    if (favoriteRecipes.isEmpty) {
      return Center(
        child: Text(
          'No tienes recetas favoritas aún.',
          style: TextStyle(fontSize: 18),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteRecipes.length,
        itemBuilder: (context, index) {
          final recipe = favoriteRecipes[index];
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
                        if (recipe['title'] == 'Frappe Chocolate') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FrappeScreen()),
                          );
                        } else if (recipe['title'] == 'Latte Vainilla') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LatteScreen()),
                          );
                        }
                      },
                      child: Text('VER DETALLES'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
