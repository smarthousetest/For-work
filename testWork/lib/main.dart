import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyStatefulWidget(),
    );
  }
}


class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}


class _MyStatefulWidgetState extends State<MyStatefulWidget> with SingleTickerProviderStateMixin{
  late final _tabController = TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
        panel:DefaultTabController(
          length: 2,
          child: MaterialApp(
            home: Scaffold(

              body: TabBarView(
                controller: _tabController,
                children: [
                  FirstPage(
                    onNext: () => _tabController.index = 1,
                  ),
                  SecondPage(
                    onNext:()=> _tabController.index = 0,
                  )
                ],
              ),
            ),
          ),
        )
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
          child: Text("Далее"),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
          onPressed: onNext,
        ),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Получить СМС"),
          onPressed: (){},
        ),
      ),
    );
  }
}