import 'package:flutter/material.dart';
import 'package:navigasi/product.dart';
import 'package:navigasi/profil.dart';
import 'package:navigasi/shop.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  String _currentMenu = 'Home';
  void _changeSelectedNavBar(int index) {
        setState(() {
          _currentIndex = index;
    
          if (index == 0) {
            _currentMenu = 'Home';
          }else if(index == 1){
            _currentMenu = 'product';
          }else if(index == 2){
            _currentMenu = 'profile';
          }else if(index == 3){
            _currentMenu = 'shop';
          }
        });
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
      child: Column(
        children: [
          Container(
            child: const UserAccountsDrawerHeader(currentAccountPicture: ClipOval(
              child: Image(image: AssetImage("image/mario.png"),
              fit: BoxFit.cover,
            ),
            ),
            accountName: Text(
              "MarioBros",
              style: TextStyle(fontSize: 20),
            ),
            accountEmail: Text("mariobros@gmail.com"),
            ),
          ),
          //menu
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => ProfilPage(),
                ),
              );
            },
            leading: Icon(Icons.people),
            title: Text("Profil"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => ProductPage(),
                ),
              );
            },
            leading: Icon(Icons.production_quantity_limits_sharp),
            title: Text("Product"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => ShopPage(),
                ),
              );
            },
            leading: Icon(Icons.shop),
            title: Text("Shop"),
          ),

        ],
      ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),
          label: 'Home'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.production_quantity_limits),
          label: 'Product'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.people),
          label: 'Profile'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.shop),
          label: 'Product'
          ),

      ],
      currentIndex: _currentIndex,
      selectedItemColor: Colors.blue,
      onTap: _changeSelectedNavBar,
      type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
