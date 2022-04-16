import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "data:image/jpeg;base64,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";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                // decoration: BoxDecoration(color: Colors.deepOrange),
                accountName: Text("Tom and Jerry"),
                accountEmail: Text("tomandjerry@gmail.com"),
                // currentAccountPicture: Image.network(imageUrl),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                title: Text("Home",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    )
                    )
                    ),
            ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                ),
                title: Text("Profile",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    )
                    )
                    ),
            ListTile(
                leading: Icon(
                  CupertinoIcons.mail,
                  color: Colors.white,
                ),
                title: Text("Email me",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    )
                    )
                    )
          ],
        ),
      ),
    );
  }
}
