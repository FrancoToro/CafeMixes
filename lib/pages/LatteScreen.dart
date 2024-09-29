import 'package:flutter/material.dart';
import 'favoritos.dart';
import 'buscar.dart';
import 'misrecetas.dart';
import 'perfil.dart';
import 'my_home_page.dart';

class LatteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receta: Latte Vainilla'),
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
                'https://osterstatic.reciperm.com/webp/10101.webp',
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Latte Vainilla',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Un delicioso café con leche y un toque de vainilla para darle un sabor especial.',
              style: TextStyle(fontSize: 16),
            ),
            Divider(height: 32, color: Colors.black),
            Text(
              'Ingredientes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('- 1 taza de leche'),
            Text('- 1 taza de café espresso'),
            Text('- 1 cucharadita de esencia de vainilla'),
            Text('- 2 cucharadas de azúcar o al gusto'),
            Text('- Canela en polvo para decorar (opcional)'),
            Divider(height: 32, color: Colors.black),
            Text(
              'Instrucciones',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('1. Calienta la leche en una olla a fuego medio hasta que esté caliente, pero sin que hierva.'),
            Text('2. Añade la esencia de vainilla y el azúcar a la leche caliente, y mezcla bien.'),
            Text('3. Prepara el café espresso y viértelo en una taza grande.'),
            Text('4. Vierte la leche caliente sobre el café, formando una capa de espuma en la parte superior.'),
            Text('5. Decora con un poco de canela en polvo si lo deseas.'),
            Text('6. ¡Disfruta de tu delicioso latte de vainilla!'),
          ],
        ),
      ),
    );
  }
}
