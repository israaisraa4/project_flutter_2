import 'package:flutter/material.dart';

class SecondTabScreen extends StatelessWidget {
  const SecondTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   GridView.builder(
      itemCount: 7,
      padding: EdgeInsets.all(10),
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10 ,mainAxisSpacing: 10),
      itemBuilder: (context,index){
        return Card(
          elevation: 4,
        );
      },
    );
  }
}
