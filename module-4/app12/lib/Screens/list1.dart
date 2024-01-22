// list1.dart
import 'package:flutter/material.dart';

class list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Scrollbar(
        child: Row(
          children: <Widget>[
            buildListItem('Recommend'),
            buildListItem('popular'),
            buildListItem('noodles'),
            buildListItem('pizza'),
          ],
        ),
      ),
    );
  }

  Widget buildListItem(String itemText) {
    return Container(
      
    width: 160.0,
      height: 50.0,
      margin: EdgeInsets.all(3.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(4),
      boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 7,
                  blurRadius: 5,
                  offset: Offset(2, 5),
                ),
              ],
    ),
      child: Center(
        
        child: Text(
          itemText,
          
          style: TextStyle(
            
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

class list1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Scrollbar(
        child: Row(
          children: <Widget>[
            buildListItem('pizza'),
            buildListItem('burger'),
            buildListItem('soup'),
            buildListItem('drink'),
             buildListItem('ice cream'),

          ],
        ),
      ),
    );
  }
  

  Widget buildListItem(String itemText) {
    return Container(
      
    width: 92.0,
      height: 50.0,
      margin: EdgeInsets.all(3.0),
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 241, 234, 234),
      borderRadius: BorderRadius.circular(10),
      
    ),
      child: Center(
        
        child: Text(
          itemText,
          
          style: TextStyle(
            
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
        
      ),
      
    );
  
  }
  
}
