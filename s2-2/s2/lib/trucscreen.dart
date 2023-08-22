
import 'package:flutter/material.dart';
import 'package:s2/model/truc.dart';

// TODO Un ecran minimal avec un tres peu de code
class trucscreen extends StatefulWidget {
  final truc le_truc;
  const trucscreen({Key? key, required this.le_truc}) : super(key: key);
  @override
  _trucscreenState createState() => _trucscreenState();
}

class _trucscreenState  extends State<trucscreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ecran truc'),
      ),
      body: Text('Tu as navigué vers truc name: '+ widget.le_truc.name + "son id est " + widget.le_truc.id.toString()),
    );
  }
}
