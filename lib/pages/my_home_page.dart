import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'favoritos.dart';
import 'buscar.dart';
import 'FrappeScreen.dart';
import 'LatteScreen.dart';
import 'misrecetas.dart';
import 'perfil.dart';


void main() {
  runApp(MyApp());
}
  
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  // Lista de recetas de ejemplo
  final List<Map<String, String>> recipes = [
    {
      'title': 'Frappe Chocolate',
      'description': 'Frappe con sabor a chocolate',
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPTtEaEnFb-Ko48_nTjuZLb86K0go1b8wcAQ&s'
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
          width: 100,
          height: 100,
        ),
        title: Text("Cafe Mixes"),
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
                color: const Color.fromARGB(128, 255, 255, 255),
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
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Mis Recetas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyRecipesScreen()),
                  ); // Cierra el Drawer
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
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return _buildRecipeList(); // Pantalla principal de recetas
      default:
        return Container(); // Manejar otras pantallas
    }
  }

  Widget _buildRecipeList() {
    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
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
                      // Navegar a la pantalla adecuada según la receta seleccionada
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
