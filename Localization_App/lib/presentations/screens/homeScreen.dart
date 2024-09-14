import 'package:flutter/material.dart';
import 'package:localization_app/app_localization.dart';
import 'package:localization_app/presentations/screens/settingScreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AppLocalizations.of(context)?.loadJsonLanguage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show loading indicator while waiting for localization to load
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          // Show an error message if something went wrong
          return const Scaffold(
            body: Center(child: Text('Error loading language')),
          );
        } else {
          // Once the localization is loaded, build the actual UI
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => settingScreen()),
                      );
                    },
                    icon: Icon(Icons.settings))
              ],
              title: Text(
                "Welcom".tr(context),
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            drawer: const Drawer(),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "hello_msg".tr(context),
                      style: const TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "h2".tr(context),
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.blue[800],
              shape: CircleBorder(),
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          );
        }
      },
    );
  }
}
