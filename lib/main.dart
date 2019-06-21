import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(title: 'Json example'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String url = 'https://randomuser.me/api/';

  Future<String> makeRequest() async {
      var response = await http.get(Uri.encodeFull(url), headers: {"Accept": "aplication/json"});
      String usuario;
      List data;

      var extractData = jsonDecode(response.body);
      data = extractData['results'];
      print(data[0]['name']['first']);
      print(data[0]['gender']);
      print(data[0]['email']);

  }


  @override
  Widget build(BuildContext context) {

    return  new Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.blue,
        iconTheme: new IconThemeData(
            color: Color(0xFF18D191)
        ),

      ),
      body: Container(
        width: double.infinity,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 80.0,
                  vertical: 20.0),
              child: new TextField(

                decoration: new InputDecoration(
                  labelText: 'Usuario'
                ),
              ),
            ),
            new SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 80.0,
                  vertical: 0.0),
              child: new TextField(
                obscureText: true,
                decoration: new InputDecoration(
                    labelText: 'Password'
                ),
              ),
            ),
            new Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        right: 15.0,
                        top: 60.0
                      ),
                      child: new Container(
                        alignment: Alignment.center,
                        height: 55.0,
                        decoration: new BoxDecoration(
                          color: Color(0xFF43A047),
                          borderRadius: new BorderRadius.circular(12.0)),
                        child: new Text("Entrar", style: new TextStyle(
                          fontSize: 25.0,
                          color: Colors.white
                        )),
                      )
                  ),
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 10.0,
                          top: 60.0
                      ),
                      child: new Container(
                        alignment: Alignment.center,
                        height: 55.0,
                        decoration: new BoxDecoration(
                            color: Color(0xFFFF5722),
                            borderRadius: new BorderRadius.circular(12.0)),
                        child: new Text("Crear cuenta", style: new TextStyle(
                            fontSize: 25.0,
                            color: Colors.white
                        )),
                      )
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
