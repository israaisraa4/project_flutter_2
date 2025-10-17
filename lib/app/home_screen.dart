import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_flutter/widgets/home_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8,initialPage: 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
         children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 190),
            child: PageView.builder(
            itemCount: 3,
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              onPageChanged: (int pageIndex){
                if(pageIndex == 2){
                  _pageController.animateToPage(0, duration: Duration(seconds: 1), curve: Curves.easeIn);
                }
              },
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsetsDirectional.only(end: index != 2 ? 10 : 0),
                  color: index % 2 == 0
                      ? Colors.black38
                      : Colors.yellow.shade200,
                  child: Center(child: Text('Container $index')),
                );
              },

            ),
          ),

          HomeSection(title: 'Most Recent', onPressed: () {}),
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
            constraints: BoxConstraints(maxHeight: 130), // height
            child: GridView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                //    mainAxisExtent: 90, // width
                // لو ما حطيت حجم بتكون 1/1

                // heigh / width
                childAspectRatio: 130 / 90,
              ),
              itemBuilder: (context, index) {
                return Container(color: Colors.grey);
              },
            ),
          ),
          SizedBox(height: 20),
          HomeSection(title: 'Favorite Products', onPressed: () {}),
          // نفس مشكله ظهرت مع انو نفس اتجاه الابو
          // انت محورك و محور الاب واحد و عدد عناصرك 10  احجز الكم يلي انت بدك ياه
          GridView.builder(
            // يلي سيطر على السكرول الابن مش الاب و الحل
            // تدخلش في السكرولينج
            physics: NeverScrollableScrollPhysics(),

            // خلي الابن ينكمش على حجم محتواه
            shrinkWrap: true,
            itemCount: 10,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
              );
            },
          ),

          HomeSection(title: 'Offers', onPressed: () {}),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                height: 100,

                margin: EdgeInsets.only(bottom: index < 6 ? 10 : 0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(offset: Offset(0, 0), color: Colors.grey),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),

                // elevation: 4,
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadiusGeometry.circular(10)
                // ),
              );
            },
          ),
        ],

    );
  }
}
