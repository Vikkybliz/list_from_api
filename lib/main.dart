import 'package:api_call/api_call.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late Future<Users> users;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    users = getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Api Calls in Flutter'),
        centerTitle: true,
      ),
      body: Center(child: FutureBuilder<Users>(
        future: users,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(snapshot.data!.name),
                Text(snapshot.data!.email),
                Text(snapshot.data!.username),
              ],
            );
          }else if (snapshot.hasError){
            return Text(snapshot.error.toString());
          }else{
            return CircularProgressIndicator();
          }
        }
        ),),
    ));
  }
}
