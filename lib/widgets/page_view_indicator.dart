import 'package:flutter/material.dart';

class PageViewIndicator extends StatelessWidget {
  const PageViewIndicator({super.key,required this.isCurrentPage,this.marginEnd = 0});
  final bool isCurrentPage;
  final double marginEnd;
  @override
  Widget build(BuildContext context) {
    return Container(
      height:4 ,
      width:18 ,
      margin:  EdgeInsetsDirectional.only(end:marginEnd ),
      decoration: BoxDecoration(
          color: isCurrentPage ? Color(0xff6a90f2) : Color(0xffdddddd),
          borderRadius: BorderRadius.circular(2)
      ),

    );
  }
}
