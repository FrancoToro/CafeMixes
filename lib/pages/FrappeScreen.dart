import 'package:flutter/material.dart';
import 'favoritos.dart';
import 'buscar.dart';
import 'misrecetas.dart';
import 'perfil.dart';
import 'my_home_page.dart';

class FrappeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receta: Frappe Chocolate'),
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
              leading: Icon(Icons.favorite),
              title: Text('Favoritos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavoritesScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPTtEaEnFb-Ko48_nTjuZLb86K0go1b8wcAQ&s',
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Frappe de Chocolate',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Una deliciosa bebida refrescante con sabor a chocolate.',
              style: TextStyle(fontSize: 16),
            ),
            Divider(height: 32, color: Colors.black),
            Text(
              'Ingredientes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('- 1 taza de leche'),
            Text('- 1/2 taza de hielo'),
            Text('- 2 cucharadas de chocolate en polvo'),
            Text('- 2 cucharadas de azúcar'),
            Text('- Crema batida al gusto'),
            Text('- Salsa de chocolate para decorar'),
            Divider(height: 32, color: Colors.black),
            Text(
              'Instrucciones',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('1. Mezcla la leche, el hielo, el chocolate en polvo y el azúcar en una licuadora.'),
            Text('2. Licúa hasta que la mezcla esté suave y espesa.'),
            Text('3. Vierte la mezcla en un vaso y agrega crema batida encima.'),
            Text('4. Decora con salsa de chocolate al gusto.'),
            Text('5. ¡Disfruta tu frappe de chocolate!'),
          ],
        ),
      ),
    );
  }
}
