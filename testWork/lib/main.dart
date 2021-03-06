import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.yellow,
          body:MyStatefulWidget()),
    );
  }
}


class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}


class _MyStatefulWidgetState extends State<MyStatefulWidget> with SingleTickerProviderStateMixin{
  late final _tabController = TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      panel:DefaultTabController(
        length: 3,
        child: TabBarView(
          controller: _tabController,
          children: [
            FirstPage(
              onNext: () => _tabController.index = 2,
            ),
            SecondPage(
              onNext:()=> _tabController.index = 0,
            ),
            ThirdPage(onNext: ()=>_tabController.index = 1)
          ],
        ),
      ),
    );
  }
}
class FirstPage extends StatelessWidget{
  const FirstPage({Key? key, required this.onNext}) : super(key: key);
  final VoidCallback onNext;
  @override
  Widget build(BuildContext context){
    return Container(
      child: Center(
        child: RaisedButton(
          child: Text("С 1 На 3 страницу"),
          onPressed: onNext ,
        ),
      ),
    );
  }
}
class SecondPage extends StatelessWidget{
  const SecondPage({Key? key, required this.onNext}) : super(key: key);
  final VoidCallback onNext;
  @override
  Widget build(BuildContext context){
    return  Stack(
        children:<Widget>[
          IconButton(
              alignment: Alignment.topLeft,
              onPressed: onNext,
              icon: const Icon(Icons.arrow_back_rounded )
          ),
          Center(
              child:RaisedButton(
                  child: Text("Получить смс"),
                  onPressed: (){})
          )
        ]
    );
  }
}
class ThirdPage extends StatelessWidget{
  const ThirdPage({Key? key, required this.onNext}) : super(key: key);
  final VoidCallback onNext;
  @override
  Widget build(BuildContext context){
    return Container(
      child: Center(
        child: RaisedButton(
          child: Text("с 3 На 2 страницу "),
          onPressed: onNext ,
        ),
      ),
    );
  }
}