import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        // padding: EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) {
          return ListTile(
            // contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.person),
            title: Text('Title $index'),
            subtitle: Text('SubTitle'),
            trailing: Icon(Icons.arrow_forward_ios),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: 5,


      // body:ListView.builder(
      //   itemCount: 5,
      //     physics: BouncingScrollPhysics(),
      //     reverse: false,
      //     padding: EdgeInsets.symmetric(horizontal: 20),
      //     itemBuilder: (context,index){
      //      return ListTile(
      //               contentPadding: EdgeInsets.zero,
      //               leading: Icon(Icons.person),
      //               title: Text('Title $index'),
      //               subtitle: Text('SubTitle'),
      //               trailing: Icon(Icons.arrow_forward_ios),
      //             );
      //     }
      // ) ,
// لما اكون انا صاحب القرار فايش اعدل و اعمل
      // body: ListView(
      //   scrollDirection: Axis.vertical,
      //   physics: BouncingScrollPhysics(),
      //   padding: EdgeInsets.symmetric(horizontal: 20),
      //   children: [
      //     ListTile(
      //       contentPadding: EdgeInsets.zero,
      //       leading: Icon(Icons.person),
      //       title: Text('Title'),
      //       subtitle: Text('SubTitle'),
      //       trailing: Icon(Icons.arrow_forward_ios),
      //     ),
      //
      //     ListTile(
      //       contentPadding: EdgeInsets.zero,
      //       leading: Icon(Icons.person),
      //       title: Text('Title'),
      //       subtitle: Text('SubTitle'),
      //       trailing: Icon(Icons.arrow_forward_ios),
      //     ),
      //
      //     ListTile(
      //       contentPadding: EdgeInsets.zero,
      //       leading: Icon(Icons.person),
      //       title: Text('Title'),
      //       subtitle: Text('SubTitle'),
      //       trailing: Icon(Icons.arrow_forward_ios),
      //     ),
      //   ],
      // ),
    );
  }
}
