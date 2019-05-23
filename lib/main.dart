import 'package:flutter/material.dart';
import 'package:flutter_demo_provider/response_display.dart';
import 'package:flutter_demo_provider/shared_state/app_state.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: MultiProvider(providers: [
          ChangeNotifierProvider<AppState>.value(notifier: AppState())
        ], child: MyHomePage()));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => appState.fetchData(),
                  child: Text("Fetch Data from Network"),
                ),
                ResponseDisplay(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
