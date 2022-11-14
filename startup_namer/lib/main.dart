import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pertemuan9.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page Pertemuan 9'),
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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(onPressed: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              await pref.setInt("is_login", 1);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Pertemuan9(title: "Halooo",)),
              );
            }, child: Text(
              "Login",
              style: TextStyle(
                  color: Colors.white
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void navigateLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? isLogin = pref.getInt("is_login");
    if (isLogin == 1){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Pertemuan9(title: "Haloooo")));
    }
  }

  @override
  void initState() {
    navigateLogin();
  }
}