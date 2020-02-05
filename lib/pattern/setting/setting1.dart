import 'package:flutter/material.dart';

class Setting1Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Setting Area1",
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
          Card(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.red,
                  ),
                  title: Text("Account"),
                  trailing: Icon(Icons.arrow_right),
                ),
                ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.red,
                  ),
                  title: Text("Mail"),
                  trailing: Icon(Icons.arrow_right),
                ),
                ListTile(
                  leading: Icon(
                    Icons.sync,
                    color: Colors.red,
                  ),
                  title: Text("Sync"),
                  trailing: Icon(Icons.arrow_right),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Setting Area2",
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
          Card(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.network_wifi,
                    color: Colors.blue,
                  ),
                  title: Text("Network"),
                  trailing: Switch(value: true, onChanged: (v) {}),
                ),
                ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.blue,
                  ),
                  title: Text("Phone"),
                  trailing: Icon(Icons.arrow_right),
                ),
                ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: Colors.blue,
                  ),
                  title: Text("Address"),
                  trailing: Icon(Icons.arrow_right),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
