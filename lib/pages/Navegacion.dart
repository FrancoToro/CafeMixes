import 'package:flutter/material.dart';
import 'FrappeScreen.dart';
import 'LatteScreen.dart';
import 'buscar.dart';
import 'misrecetas.dart';
import 'perfil.dart';

class NavegacionScreen extends StatefulWidget {
  @override
  _NavegacionScreenState createState() => _NavegacionScreenState();
}

class _NavegacionScreenState extends State<NavegacionScreen> {
  double _imageScale = 1.0; // Escala inicial de la imagen

  void _increaseImageSize() {
    setState(() {
      _imageScale += 0.1; // Aumentar la escala de la imagen
    });
  }

  void _decreaseImageSize() {
    setState(() {
      _imageScale = (_imageScale > 0.1) ? _imageScale - 0.1 : 0.1; // Reducir la escala de la imagen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tiendas Cercanas'),
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
      body: Stack(
        children: [
          Center(
            child: Transform.scale(
              scale: _imageScale, // Aplicar la escala a la imagen
              child: Image.network(
                'https://i.blogs.es/bea80b/diseno-sin-titulo-11-/1366_2000.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Botones en la parte inferior derecha
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Evitar que la columna tome más espacio del necesario
                children: [
                  FloatingActionButton(
                    onPressed: _increaseImageSize,
                    tooltip: 'Aumentar',
                    child: Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: _decreaseImageSize,
                    tooltip: 'Reducir',
                    child: Icon(Icons.remove),
                  ),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
