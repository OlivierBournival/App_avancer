import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> btntexts = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 10; ++i) {
      btntexts.add('btn $i');
    }
  }

  void _moveItemUp(int index) {
    if (index > 0) {
      setState(() {
        final item = btntexts.removeAt(index);
        btntexts.insert(index - 1, item);
      });
    }
  }

  void _moveItemDown(int index) {
    if (index < btntexts.length - 1) {
      setState(() {
        final item = btntexts.removeAt(index);
        btntexts.insert(index + 1, item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: btntexts.length,
          itemBuilder: (BuildContext c, int index) {
            return Card(
              margin: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.blue,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      btntexts[index],
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _moveItemUp(index);
                        },
                        child: Icon(Icons.arrow_upward),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _moveItemDown(index);
                        },
                        child: Icon(Icons.arrow_downward),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
