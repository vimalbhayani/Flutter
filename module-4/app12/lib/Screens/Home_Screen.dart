import 'package:app1/Screens/cart.dart';
import 'package:app1/Screens/list1.dart';
import 'package:app1/Widget/food_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> foodItems = [
    {'name': 'Pizza', 'price': 9.99, 'image': 'assets/images/pizaa.jpeg'},
    {'name': 'Burger', 'price': 4.99, 'image': 'assets/images/pizaa.jpeg'},
    {'name': 'Pasta', 'price': 7.99, 'image': 'assets/images/pizaa.jpeg'},
    {'name': 'Salad', 'price': 5.99, 'image': 'assets/images/pizaa.jpeg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 1),
              Text(
                "Menu",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 20),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {},
              ),
            ],
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: list(),
                ),
                SliverToBoxAdapter(
                  child: list1(),
                ),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return GridItem(
                        name: foodItems[index]['name'],
                        price: foodItems[index]['price'],
                        image: foodItems[index]['image'],
                      );
                    },
                    childCount: foodItems.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications_active),
              onPressed: () {
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_bag),
              onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>CartScreen(cartItems: cartItems)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
