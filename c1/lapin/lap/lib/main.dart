

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'tape lapin'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // T
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _indexlapin = Random().nextInt(4) ;
  int _nblapin = 0;
  int _nbpaf = 0;
  int _paf =0;
  int _flop =0;

void geretape(int index){
  print('btn'+ index.toString());
  if (this._indexlapin == index ){
    this._nblapin++;
    _indexlapin =  Random().nextInt(4) ;

  }else{
    this._nbpaf;
  }
  setState(() {});
}


  @override
  Widget build(BuildContext context) {
    //
    var b1 = MaterialButton(
      onPressed: () {
        geretape(1);
      },
      child: Text(this._indexlapin ==1 ?   'Lapin' : 'taupe'),
    );
    var b2 = MaterialButton(
      onPressed: () {
        geretape(2);
    },
      child: Text(this._indexlapin ==2 ?   'Lapin' : 'taupe'),

    );
    var b3 = MaterialButton(
      onPressed: () {
        geretape(3);
      },
      child: Text(this._indexlapin ==3 ?   'Lapin' : 'taupe'),
    );
    var b0 = MaterialButton(
      onPressed: () {
        geretape(0);
      },
      child: Text(this._indexlapin ==0 ?   'Lapin' : 'taupe'),
    );


    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[



            const Text(
              'Tape le lapin', style: TextStyle(fontWeight: FontWeight.w800),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('paf : ' + this._nblapin.toString() , style: TextStyle(color: Colors.greenAccent, fontSize: 20),),
                Text('flob : ' + this._nbpaf.toString(), style: TextStyle(color: Colors.redAccent, fontSize: 20),)
              ],
            ),

               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  b3,

                  b0,


                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                b1,

                b2,


              ],
            ),





          ],
        ),
      ),
    );
  }
}
