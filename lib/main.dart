import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myflutek/Fight.dart';

import 'Character.dart';
import 'cardGame.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FightMagicka',
      theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Pacifico'),
      home: MyHomePage(title: 'Magicka'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Character character1 = new Character(100, 200, 20, 80);
  Character character2 = new Character(100, 200, 30, 40);

  void _incrementCounter() {
    setState(() {
      var fight = Fight(character1, character2);
      fight.startFight();
      print(character1.HP);
      print(character2.HP);
    });
  }

  void _reset() {
    setState(() {
      character1 = new Character(100, 200, 20, 80);
      character2 = new Character(100, 200, 30, 40);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings_backup_restore),
            onPressed: () {
              _reset();
            },
          ),
        ],
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/forest.jpg'),
              fit: BoxFit.fitHeight,
            ),
          ),
          // color: Colors.brown,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.4)),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    // horizontal).
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CardGame(
                        Asset: "assets/magicka.jpg",
                        HP: character1.HP.toString(),
                        Mana: character1.Mana.toString(),
                        Moc: character1.Moc.toString(),
                        Szansa: character1.Szansa.toString(),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          _incrementCounter();
                          if (character1.HP < 0) {
                            AlertDialog(
                                title: Text("Title"),
                                content: Text("tekst"),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('Ok'),
                                    onPressed: () {},
                                  )
                                ]);
                          }
                        },
                        child: Text("VS"),
                      ),
                      CardGame(
                        Asset: "assets/warrior.jpg",
                        HP: character2.HP.toString(),
                        Mana: character2.Mana.toString(),
                        Moc: character2.Moc.toString(),
                        Szansa: character2.Szansa.toString(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
