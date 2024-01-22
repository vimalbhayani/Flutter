import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Media App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Media App'),
            ),
            ListTile(
              title: Text('Gallery'),
              onTap: () {
                _changePage(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Audio'),
              onTap: () {
                _changePage(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Video'),
              onTap: () {
                _changePage(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _buildPage(_currentIndex),
    );
  }

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return GalleryPage();
      case 1:
        return AudioPage();
      case 2:
        return VideoPage();
      default:
        return Container();
    }
  }
}

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Gallery Page '),
    );
  }
}

class AudioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Audio Page '),
    );
  }
}

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Video Page '),
    );
  }
}
