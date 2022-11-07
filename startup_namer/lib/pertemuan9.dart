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
        primarySwatch: Colors.blue,
      ),
      home: const Pertemuan9(title: 'Flutter Demo Home Page Pertemuan 9'),
    );
  }
}

class Pertemuan9 extends StatefulWidget {
  const Pertemuan9({super.key, required this.title});

  final String title;

  @override
  State<Pertemuan9> createState() => _Pertemuan9State();
}

class _Pertemuan9State extends State<Pertemuan9> {
  int _counter = 2;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: new InputDecoration(
                labelText:  "Email",
                hintText: "Teks yang akan dimasukkan",
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5)
                  )
              ),
            ),
            Padding(
                padding: EdgeInsets.all(5)
            ),
            TextFormField(
              decoration: new InputDecoration(
                labelText:  "Password",
                hintText: "Teks yang akan dimasukkan",
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(5)
                )
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text(
              "Submit",
              style: TextStyle(
                color: Colors.white
              ),
            ))
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}