import 'package:flutter/material.dart';

class Option_Menu extends StatelessWidget {
  const Option_Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Option menu'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Profile'){
                print('Profile select');
              }
              else if(value == 'logout'){
                print('Logout select');
              }
            },
            itemBuilder: (BuildContext context) =>[
              PopupMenuItem<String>(
                value: 'Profile',
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                )),
                PopupMenuItem<String>(
                value: 'logout',
                child: ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('logout'),
                )),
            ],
          ),
        ],
      ),
      body: Center(
        child: Text('your app content goes here'),
      ),
    );
  }
}
