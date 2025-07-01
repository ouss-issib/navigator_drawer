import 'package:flutter/material.dart';
import 'package:flutter_navigator/global/global_parameters.dart';
import 'package:provider/provider.dart';
import 'package:flutter_navigator/providers/auth_provider.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);

    return Drawer(
      child: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: ListView.separated(
              itemCount: GlobalParameters.menus.length,
              separatorBuilder: (context, index) =>
                  Divider(color: Colors.blueAccent, height: 1),
              itemBuilder: (context, index) {
                final item = GlobalParameters.menus[index];
                return ListTile(
                  leading: item["icon"] as Icon,
                  title: Text(
                    item["title"] as String,
                    style: TextStyle(color: Colors.blueAccent, fontSize: 18),
                  ),
                  trailing: Icon(Icons.arrow_right, color: Colors.blueAccent),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, item["route"] as String);
                  },
                );
              },
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.blueAccent),
            title: Text("Logout", style: TextStyle(color: Colors.blueAccent, fontSize: 18)),
            onTap: () {
              auth.logout();
              Navigator.of(context).pushReplacementNamed("/login");
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage("images/logo.jpg"),
          ),
          SizedBox(width: 20),
          Text(
            "E-Navigator",
            style: TextStyle(
                fontSize: 24, color: Colors.blueAccent, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
