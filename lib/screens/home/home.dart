import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/brew_list.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: Text("Bottom Sheet"),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Brew Crew"),
          elevation: 0.0,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () async {
                await _auth.signOut();
              },
              iconSize: 26.0,
            )
          ],
        ),
        body: BrewList(),
        floatingActionButton: Container(
          height: 62.0,
          width: 62.0,
          child: FittedBox(
            child: FloatingActionButton(
              tooltip: "Change your preferences",
              child: Icon(Icons.settings, size: 28.0),
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () => _showSettingsPanel(),
            ),
          ),
        ),
      ),
    );
  }
}
