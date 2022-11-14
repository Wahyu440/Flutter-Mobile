import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:startup_namer/main.dart';

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
            )),
            ElevatedButton(onPressed: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              await pref.setInt("is_login", 0);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage(title: "Halooo",)),
              );
            }, child: Text(
              "Logout",
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