import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10
          ),
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          itemCount: 10,


          itemBuilder: (context,index){
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                // side: BorderSide(
                //   width: 1
                // )
              ),
            );

          }

      // body:GridView(
      //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      //    scrollDirection: Axis.vertical,
      //     gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
      //         // بتتحكم بشكل افتراضي في الحجم بحيث الحجم الافتراضي بكون
      //       // لو كان محور عمودي و عدد عناصر 2 بناخذ عرض شاشه بنقسمها على 2 و بنطرح مسافات في الكروس
      //         crossAxisCount: 2,
      //         crossAxisSpacing: 10, // قديش مساحه بين عناصر افقيا
      //         mainAxisSpacing:  10 , //قديش مساحه بين عناصر عموديا
      //        // لتحديد الشكل الطولي
      //         // mainAxisExtent:225 ,
      //        // childAspectRatio: cross / main
      //         childAspectRatio: 132 / 225
      //     ),
      //
      //   // width 100  height : 170
      //   children: [
      //     Container(
      //       color: Colors.cyan,
      //     ),
      //     Container(
      //       color: Colors.pink,
      //     ),
      //     Container(
      //       color: Colors.brown,
      //     ),
      //     Container(
      //       color: Colors.yellow,
      //     ),
      //   ],
      //
      //
      // ) ,


    );
  }
}
