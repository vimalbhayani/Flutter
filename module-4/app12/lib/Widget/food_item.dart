import 'package:app1/Screens/cart.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Items'),
      ),
      body:Column(
        children: [
      buildMenuGrid()
        ],
        
      )
      
      
    );
  }

  Widget buildMenuGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        MenuItem item = menuItems[index];
        return GridItem(
          name: item.name,
          price: item.price,
          image: 'assets/images/item_image.jpg',
        );
      },
    );
  }

  void addMenuItem(String name, double price) {
    var existingItem = menuItems.firstWhere(
      (item) => item.name == name,
      orElse: () => MenuItem(name: name, price: price, quantity: 0),
    );

    if (existingItem.quantity == 0) {
      menuItems.add(existingItem);
    }
    existingItem.quantity++;
  }

  void _showAddToCartSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: menuItems.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(menuItems[index].name),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  if (menuItems[index].quantity > 0) {
                                    setState(() => menuItems[index].quantity--);
                                  }
                                },
                              ),
                              Text('${menuItems[index].quantity}'),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  setState(() => menuItems[index].quantity++);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Text('Total: \$${calculateTotal().toStringAsFixed(2)}'),
                  ElevatedButton(
                    child: Text('Go to Cart'),
                    onPressed: () {
                      _addToCart(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartScreen(cartItems: cartItems)),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _addToCart(BuildContext context) {
    for (var menuItem in menuItems) {
      if (menuItem.quantity > 0) {
        var found = cartItems.firstWhere(
          (item) => item.name == menuItem.name,
          orElse: () => CartItem(name: menuItem.name, price: menuItem.price, quantity: 0),
        );

        if (found.quantity == 0) {
          cartItems.add(CartItem(name: menuItem.name, price: menuItem.price, quantity: menuItem.quantity));
        } else {
          found.quantity += menuItem.quantity;
        }

        menuItem.quantity = 0;
      }
    }
  }

  double calculateTotal() {
    return menuItems.fold(0.0, (total, item) => total + (item.price * item.quantity));
  }
}

class CartItem {
  String name;
  double price;
  int quantity;

  CartItem({required this.name, required this.price, required this.quantity});
}

class MenuItem {
  String name;
  double price;
  int quantity;

  MenuItem({required this.name, required this.price, this.quantity = 1});
}

List<MenuItem> menuItems = [];
List<CartItem> cartItems = [];

class GridItem extends StatelessWidget {
  final String name;
  final double price;
  final String image;

  const GridItem({
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$$price',
                      style: TextStyle(color: Colors.green),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        _MenuScreenState().addMenuItem(name, price);
                        _MenuScreenState()._showAddToCartSheet(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
