import 'package:flutter/material.dart';
import 'package:fruit_ui/pages/cart.dart';
import 'package:fruit_ui/pages/favourites.dart';
import 'package:fruit_ui/pages/home.dart';
import 'package:fruit_ui/pages/products.dart';
import 'package:fruit_ui/pages/profile.dart';

class FruitUi extends StatefulWidget {
  const FruitUi({super.key});

  @override
  State<FruitUi> createState() => _FruitUiState();
}

class _FruitUiState extends State<FruitUi> {
  int selectedIndex = 0;
  List pages = [
    const HomePage(),
    const Products(),
    const FavPage(),
    const CartPage(),
    const Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            // backgroundColor: Colors.amber,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.black.withOpacity(.3),
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Product"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favourites"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.production_quantity_limits), label: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ]),
      ),
    );
  }
}
