import 'package:flutter/material.dart';
import 'package:startup_namer/homeDrawer.dart';
import 'package:startup_namer/mahasiswa/mahasiswa_update.dart';
import 'mahasiswa_add.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Mahasiswa_get extends StatefulWidget {
  const Mahasiswa_get({Key? key}) : super(key: key);

  @override
  State<Mahasiswa_get> createState() => _Mahasiswa_getState();
}

class _Mahasiswa_getState extends State<Mahasiswa_get> {
  List _get = [];

  @override
  void initState() {
    super.initState();
    _getDataMhs();
  }
  
  Future _getDataMhs() async {
    try {
      final response = await http.get(Uri.parse('https://kpsi.fti.ukdw.ac.id/api/progmob/mhs/72200440'));
      if(response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _get.clear();
          _get = data;
        });
      }
    } catch (e){
      print(e);
    }
  }

  Future _deleteDataMhs(String id, nim_progmob) async {
    final http.Response response = await http.post(
      Uri.parse('https://kpsi.fti.ukdw.ac.id/api/progmob/mhs/delete'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': id,
        'nim_progmob': nim_progmob
      }),
    );
    if (response.statusCode == 200) {
      _getDataMhs();
    } else {
      throw Exception('Failed to load response');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mahasiswa'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Mahasiswa_add()));
        },
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/logoipsum.png"),
              ),
              accountName: Text("Wahyu"),
              accountEmail: Text("wahyu.vivacious@si.ukdw.ac.id"),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeDrawer()));
              },
            ),
            ListTile(
              title: const Text('Mahasiswa'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Mahasiswa_get()));
              },
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _getDataMhs,
        child: ListView.builder(
            itemCount: _get.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black45, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  title: Text(_get[index]['nim'] + "-" + _get[index]['nama']),
                  subtitle: Text(_get[index]['email']),
                  trailing: PopupMenuButton(
                    icon: Icon(Icons.more_vert),
                    onSelected: (result) {
                      if (result == 'edit') {
                        Navigator.push(
                          context,
                          //Untuk kirim data dari list data mahasiswa
                          MaterialPageRoute(builder: (context) => Mahasiswa_update(
                            id: _get[index]['id'].toString(),
                            nim: _get[index]['nim'].toString(),
                            nama: _get[index]['nama'].toString(),
                            alamat: _get[index]['alamat'].toString(),
                            email: _get[index]['email'].toString(),
                            foto: _get[index]['foto'].toString(),
                          )),
                        );
                      }
                    },
                    itemBuilder: (context) {
                      return[
                        PopupMenuItem(
                          child: Text('Edit'),
                          value: 'edit',
                          // onTap: () {
                          //   Navigator.push(context,
                          //       MaterialPageRoute(builder: (context) => Mahasiswa_update()));
                          // },
                        ),
                        PopupMenuItem(
                          child: Text('Delete'),
                          value: 'delete',
                          onTap: () async {
                            _deleteDataMhs(_get[index]['id'].toString(), '72200440');
                          },
                        ),
                      ];
                    },
                  ),
                ),
              );
            }),
      )
    );
  }
}
