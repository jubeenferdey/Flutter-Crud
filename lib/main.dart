// ignore_for_file: avoid_unnecessary_containers

// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Crud Operations"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          // ignore: prefer_const_constructors
          child: Form(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              child: Container(
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        UserName(),
                        Padding(padding: EdgeInsets.all(8)),
                        Password(),
                        Padding(padding: EdgeInsets.all(8)),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 28.5),
                          child: Row(
                            children: const [
                              SnackBarPage(
                                buttonName: "Create",
                                message:
                                    "Data stored in Database Successfully.",
                              ),
                              Padding(padding: EdgeInsets.all(5)),
                              SnackBarPage(
                                  buttonName: "Read",
                                  message: "Data Retrieved."),
                              Padding(padding: EdgeInsets.all(5)),
                              SnackBarPage(
                                  buttonName: "Update",
                                  message: "Database Updated."),
                              Padding(padding: EdgeInsets.all(5)),
                              SnackBarPage(
                                buttonName: "Delete",
                                message: "Data Deleted :(",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
        ));
  }
}

class UserName extends StatelessWidget {
  const UserName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: "Username", border: OutlineInputBorder()),
      keyboardType: TextInputType.text,
    );
  }
}

class Password extends StatelessWidget {
  const Password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
          // ignore: unnecessary_const
          labelText: "Password",
          border: OutlineInputBorder()),
      obscureText: true,
      keyboardType: TextInputType.text,
    );
  }
}

class SnackBarPage extends StatefulWidget {
  final String buttonName;
  final String message;
  const SnackBarPage(
      {Key? key, required this.buttonName, required this.message})
      : super(key: key);

  @override
  SnackBarPageState createState() => SnackBarPageState();
}

class SnackBarPageState extends State<SnackBarPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          final snackbar = SnackBar(
            content: Text(widget.message),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        },
        child: Text(widget.buttonName),
      ),
    );
  }
}
