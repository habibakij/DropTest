/// akij dev
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _value= '';
  List<DropdownMenuItem<String>> menuList= new List();

  final mobile= {"1":"samesung", "2":"nokia", "3":"realmi"};
  final computer= {"1":"hp", "2":"asos", "3":"dell"};
  final tab= {"1":"lenebo", "2":"oppo", "3":"mi"};
  bool check= true;

  void getMob(){
    for(String key in mobile.keys){
      menuList.add(DropdownMenuItem<String>(
        value: mobile[key],
        child: Center(
          child: Text(mobile[key]),
        ),
      ));
    }
  }

   void getCom(){
    for(String key in computer.keys){
      menuList.add(DropdownMenuItem<String>(
        value: computer[key],
        child: Center(
          child: Text(computer[key]),
        ),
      ));
    }
  }

  void getTab(){
    for(String key in tab.keys){
      menuList.add(DropdownMenuItem<String>(
        value: tab[key],
        child: Center(
          child: Text(tab[key]),
        ),
      ));
    }
  }

  void changeValue(_new){
    if(_new == "mobile"){
      menuList.clear();
      getMob();
    } else if(_new == "computer"){
      menuList.clear();
      getCom();
    } else if(_new == "tab"){
      menuList.clear();
      getTab();
    }
    setState(() {
      _value = _new;
      check= false;
    });
  }

  void changeValue2(_new){
    setState(() {
      _value = _new;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [

            Padding(
              padding: EdgeInsets.all(5.0),
              child: DropdownButton<String>(
                  items: [
                    DropdownMenuItem<String>(
                      value: "mobile",
                      child: Center(
                          child: Text("mobile")
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: "computer",
                      child: Center(
                          child: Text("computer")
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: "tab",
                      child: Center(
                          child: Text("tab")
                      ),
                    ),
                  ],
                  //value: _value,
                  onChanged: (_new) => changeValue(_new),
                hint: Text('select first'),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(5.0),
              child: DropdownButton<String>(
                items: menuList,
                onChanged: check ? null : (_new) => changeValue2(_new),
                disabledHint: Text('first select'),
              ),
            ),

            Text("$_value"),
          ],
        ),
      ),
    );
  }
}

