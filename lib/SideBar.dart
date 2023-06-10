import 'package:flutter/material.dart';
import 'package:study_ruin/ProfileSection.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu of Hope',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Handle the onTap action for the Home option
              Navigator.pop(context);
              // Add your desired action here
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
            onTap: () {
              // Handle the onTap action for the Favorites option
              Navigator.pop(context);
              // Add your desired action here
            },
          ),
          ListTile(
  leading: Icon(Icons.person),
  title: Text('Profile'),
  onTap: () {
    Navigator.pop(context); // Close the drawer
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileSection(),
      ),
    );
  },
),
        ],
      ),
    );
  }
}
