import 'package:flutter/material.dart';

class FirstTabScreen extends StatelessWidget {
  const FirstTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index){
          return ListTile(
            leading: Icon(Icons.person),
            title: Text('Title'),
          );
        });
  }
}
