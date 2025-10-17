import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_flutter/app/Drawer/tabs/first_tab_screen.dart';
import 'package:project_flutter/app/Drawer/tabs/second_tab_screen.dart';

class SecondFavoritesScreen extends StatefulWidget {
  const SecondFavoritesScreen({super.key});

  @override
  State<SecondFavoritesScreen> createState() => _SecondFavoritesScreenState();
}

class _SecondFavoritesScreenState extends State<SecondFavoritesScreen>
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
    return Scaffold(
      appBar: AppBar(title: Text('Second Favorites')),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(radius: 40),
          SizedBox(height: 10),
          Text('Title here', style: TextStyle(color: Colors.black)),
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
            tabs:const [
              Tab(text: 'First'),
              Tab(text: 'Second'),
              Tab(text: 'Thread'),
              // Tab(text: 'Forth',), // مارح يعملخ تاب لانو 3 فوق انا حاطة
            ],
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                FirstTabScreen(),
                SecondTabScreen(),
                Center(child: Text('Tab 3 ')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
