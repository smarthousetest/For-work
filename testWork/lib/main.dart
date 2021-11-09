import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Home()
    );
  }
}


class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}
class HomeState extends State<Home> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:  Center(
            child: FirstScreen(),
          ),
    );
  }
}


class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.yellow,
      body: SlidingUpPanel(
        panel: Center(
        child: RaisedButton(
          child: new Text("Авторизация"),
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context)=>SlidingUpPanel(
                defaultPanelState:PanelState.OPEN,
                panel:SecondScreen())));
          },
        ),
      ),
      )
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(backgroundColor: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),),
      body:  Center(
        child: RaisedButton(
          child: new Text("Код из смс"),
          onPressed: () {
          },
        ),
      )
    );
  }
}