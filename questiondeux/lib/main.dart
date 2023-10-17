import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'NuberInfo.dart';

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
  int _counter = 0;
  int numCurent = 0 ;
  final TextEditingController textFieldController = TextEditingController();
  late final List<NumberInfo> listofnum = [];
  late List<NumberInfo> nums = [];
  Future<List<NumberInfo>> listgetNumItem( int number) async {
    try {
      var response = await Dio().get(
        'https://4n6.azurewebsites.net/exam/representations/'+number.toString(),
      );

      if (response.statusCode == 200) {
        var listeJSON = response.data as List;
        var listeTask = listeJSON.map(
                (elementJSON) {
              return NumberInfo.fromJson(elementJSON);
            }
        ).toList();
        return listeTask;
      } else {
        throw Exception('Échec de la requête.');
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }
  Future<void> loadTasks(int number) async {
    try {
      final NumbersItems = await listgetNumItem(number);
      setState(() {
        listofnum.clear(); // Clear the existing tasks before adding new ones
        for (var TaskItem in NumbersItems) {
          var num = NumberInfo(

            nombre: TaskItem.nombre, // Use the appropriate property names
            description: TaskItem.description,
            representation: TaskItem.representation,
          );
          listofnum.add(num);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Liste des tâches'),
          backgroundColor: Color(0xFF0E21A0),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: textFieldController,
                decoration: InputDecoration(
                  hintText: 'Enter a task...',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final textValue = textFieldController.text;
                if (textValue.isNotEmpty) {
                  final number = int.tryParse(textValue);
                  if (number != null) {
                    loadTasks(number);
                  } else {
                    // Handle invalid input (not an integer)
                    // You can show an error message or take appropriate action here
                  }
                }
              },
              child: Text('GET NUM'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listofnum.length,
                itemBuilder: (context, index) {
                  final task = listofnum[index];

                  return ListTile(
                    title: Text(task.nombre.toString()),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('REPRE  ' + task.representation.toString()),

                        SizedBox(height: 8.0),
                        Text('DESCRIP ' + task.description .toString() + '%'),

                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
