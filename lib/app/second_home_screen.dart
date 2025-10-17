import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_flutter/widgets/home_section.dart';
// هنا خليت يلي فوق ثابت و يلي تحت متحرك
class SecondHomeScreen extends StatelessWidget {
  const SecondHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Second Home'),
        backgroundColor: Colors.blue.shade100,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          // scrollDirection: Axis.vertical,
          //
          // physics: NeverScrollableScrollPhysics(),
          // padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          children: [
            HomeSection(title: 'Most Recent',onPressed: (){},),
            // هلقيت انا حطيت اشي بتمدد في الاتجاه معاكس فلازم احجم الستا لانو اخذت انفنتي في تمدد
            // ConstrainedBox(
            //   constraints: BoxConstraints(maxHeight:100 ),
            //   child: ListView.builder(
            //       itemCount: 10,
            //       scrollDirection:  Axis.horizontal,
            //       itemBuilder: (context,index){
            //     return Container(
            //       width: 100,
            //       height: 100,
            //       color: Colors.grey,
            //       margin: EdgeInsetsDirectional.only(end: index !=9 ? 10 : 0),
            //     );
            //   }),
            // )

            // مهم
            // اذا اختلف تمدد المحور الرئيسي عن الابن او الابن عن الاب
            // الابن افقي و الاب عمودي يجب تحجيم الابن لانو راح يحمل تمدد انفنتي
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight:130 ), // height
              child: GridView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 10,
                  //    mainAxisExtent: 90, // width
                  // لو ما حطيت حجم بتكون 1/1

                  // heigh / width
                  childAspectRatio: 130/90,

                ) ,
                itemBuilder: (context , index) {
                  return Container(
                    color: Colors.grey,
                  );
                },
              ),
            ),
            SizedBox(height: 20,),
           // اكسبانددعلى لست فيو ممنوع
             // حطيت اكسباندد علشان احط الكولوم
            // انا حصرت السكرول فيما تبقى من مساحة الكولوم
            Expanded(
              //ListView or column with SingleChildScrollView
              child: ListView(

                children: [
                  HomeSection(title: 'Favorite Products',onPressed: (){},),
                  // نفس مشكله ظهرت مع انو نفس اتجاه الابو
                  // انت محورك و محور الاب واحد و عدد عناصرك 10  احجز الكم يلي انت بدك ياه
                  GridView.builder(
                    // يلي سيطر على السكرول الابن مش الاب و الحل
                    // تدخلش في السكرولينج
                    physics: NeverScrollableScrollPhysics(),

                    // خلي الابن ينكمش على حجم محتواه
                    shrinkWrap: true,
                    itemCount: 6,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10
                    ), itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10)
                      ),

                    );
                  },),

                  HomeSection(title: 'Offers',onPressed: (){},),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (context,index){
                        return Container(
                          height: 100,

                          margin: EdgeInsets.only(bottom: index <6 ? 10 : 0),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(offset: Offset(0,0),
                                    color: Colors.grey)
                              ],
                              borderRadius: BorderRadius.circular(10)
                          ),
                          // elevation: 4,
                          // shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadiusGeometry.circular(10)
                          // ),

                        );
                      }),
                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}
