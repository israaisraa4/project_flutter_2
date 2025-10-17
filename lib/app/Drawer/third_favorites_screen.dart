import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_flutter/app/Drawer/tabs/first_tab_screen.dart';
import 'package:project_flutter/app/Drawer/tabs/second_tab_screen.dart';

class ThirdFavoritesScreen extends StatefulWidget {
  const ThirdFavoritesScreen({super.key});

  @override
  State<ThirdFavoritesScreen> createState() => _ThirdFavoritesScreenState();
}

class _ThirdFavoritesScreenState extends State<ThirdFavoritesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // this بتعود على TickerProvider
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // اجيب حجم شاشه
   // print(MediaQuery.of(context).size.height);
    return Scaffold(
      appBar: AppBar(title: Text('Third Favorites')),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Column(
            children: [
              CircleAvatar(radius: 40),
              SizedBox(height: 10),
              Text(
                'Title here',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 10),
              TabBar(
                // اذا زاد عدد القيم
                //  isScrollable: true,
                indicatorColor: Colors.blue,
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,

                labelPadding: EdgeInsets.all(5),
                labelStyle: GoogleFonts.aboreto(),
                unselectedLabelStyle: GoogleFonts.aboreto(),
                /***************/
                onTap: (int selectedTabIndex) {},
                controller: _tabController,
                tabs: const [
                  Tab(text: 'First'),
                  Tab(text: 'Second'),
                  Tab(text: 'Thread'),
                  // Tab(text: 'Forth',), // مارح يعملخ تاب لانو 3 فوق انا حاطة
                ],
              ),
            ],
          ),
          IndexedStack(
            index: _tabController.index,
            children: [
              Visibility(
                visible: _tabController.index == 0,
                child: FirstTabScreen(),
              ),
              Visibility(
                visible: _tabController.index == 0,
                child: SecondTabScreen(),
              ),
              //Center(child: Text('Tab 3 ')),
            ],
          ),

          // SizedBox(
          //   // اجيب حجم عناصر و اضر بعددهم و بطرحهم من المساحه يلي فوق  الاب بار و محتوى هاي لخمه
          //
          //   height: MediaQuery.of(context).size.height -187 - 80 /* ساحة و الاب بار و لو في بادنف بنقص */,
          //   child: TabBarView(
          //     controller: _tabController,
          //     children: [
          //       FirstTabScreen(),
          //       SecondTabScreen(),
          //       Center(child: Text('Tab 3 ')),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
