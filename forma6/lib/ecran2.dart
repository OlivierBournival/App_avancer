import 'package:flutter/material.dart';

import 'main.dart';

class Ecran2 extends StatefulWidget {
  @override
  _Ecran2State createState() => _Ecran2State();
}

class _Ecran2State extends State<Ecran2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ecran 2'),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        color: Colors.green,
        child: Column(
          children: [
            Container(
              child: Align(
                alignment: Alignment.topCenter,
                child: Expanded(
                  child: Container(
                    height: 30,
                    margin: EdgeInsets.all(5),
                    color: Colors.amber,
                  ),
                ),
              ),

            ),
            //Align(alignment: Alignment.center , child: Expanded(flex: 1, child: Text("Texte au milieux"))),
             Expanded(flex: 1, child: Align(alignment: Alignment.center ,child: Text("Texte au milieux"))),
            ElevatedButton(
              onPressed: () {},
              child: Text('Pipo Popi'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFEC53B0),
                onPrimary: Colors.amber,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyApp(),
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.arrow_left),
      ),
    );
  }
}
