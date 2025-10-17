import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_flutter/app/categories_screen.dart';
import 'package:project_flutter/app/home_screen.dart';
import 'package:project_flutter/app/settings_screen.dart';
import 'package:project_flutter/app/users_screen.dart';
import 'package:project_flutter/models/bn_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedPageIndex = 0;
  final List<BnScreen> _screens = <BnScreen>[
    const BnScreen(title: 'Home', widget: HomeScreen()),
    const BnScreen(title: 'Category', widget: CategoriesScreen()),
    const BnScreen(title: 'Users', widget: UsersScreen()),
    const BnScreen(title: 'Settings', widget: SettingsScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedPageIndex].title),
        backgroundColor: Colors.blue.shade200,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                // radius: 40,
              ),
              accountName: Text('Israa Lubbad'),
              accountEmail: Text('israa@gmail.co,'),

              //  بحط قد ما بدي صور
              //otherAccountsPictures: [
              // CircleAvatar(),
              // CircleAvatar(),
              // CircleAvatar(),
              // ],
            ),

            ListTile(
              onTap: () {
                // انو لما اضغط عليهت بتسكر
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 500), () {
                  Navigator.pushNamed(context, '/faqs_screen');
                });
              },
              leading: Icon(Icons.question_answer),
              title: Text('FAQs'),
              subtitle: Text('Frequent Questions'),
              trailing: Icon(Icons.arrow_forward_ios, size: 18),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 500), () {
                  Navigator.pushNamed(context, '/frequent_questions_screen');
                });
              },
              leading: Icon(Icons.question_answer),
              title: Text('Frequent Questions'),
              subtitle: Text('Frequent Questions'),
              trailing: Icon(Icons.arrow_forward_ios, size: 18),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 500), () {
                  Navigator.pushNamed(context, '/favorite_screen');
                });
              },
              leading: Icon(Icons.favorite),
              title: Text('Favorites'),
              subtitle: Text('Favorites prodact'),
              trailing: Icon(Icons.arrow_forward_ios, size: 18),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 500), () {
                  Navigator.pushNamed(context, '/second_favorite_screen');
                });
              },
              leading: Icon(Icons.favorite),
              title: Text('Second Favorites'),
              subtitle: Text('Favorites prodact'),
              trailing: Icon(Icons.arrow_forward_ios, size: 18),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 500), () {
                  Navigator.pushNamed(context, '/third_favorites_screen');
                });
              },
              leading: Icon(Icons.favorite),
              title: Text('Third Favorites'),
              subtitle: Text('Favorites prodact'),
              trailing: Icon(Icons.arrow_forward_ios, size: 18),
            ),

            // للي بدخ يغلب حالخ
            // Container(
            //   padding: EdgeInsets.all(16),
            //   height: 300,
            //   color: Colors.blue,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       CircleAvatar(
            //
            //         radius: 40,
            //       ),
            //       SizedBox(height: 10),
            //       Text('Israa Lubbaad',style: GoogleFonts.montserrat(
            //         fontSize: 18,
            //         color: Colors.white
            //       ),),
            //        SizedBox(height: 5,),
            //       Text('israa@gmail.com',style: GoogleFonts.montserrat(
            //           fontSize: 15,
            //           color: Colors.white54
            //       ),),
            //     ],
            //   ),
          ],
        ),
      ),

      //بشيل اليكفلد من سكرن علشان ما احمل على الويدجت
      body: _screens[_selectedPageIndex].widget,

      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(topRight: Radius.circular(16),topLeft: Radius.circular(16)),
        child: BottomNavigationBar(
          onTap: (int selectedPageIndex) {
            setState(() {
              _selectedPageIndex = selectedPageIndex;
            });
          },
        
          currentIndex: _selectedPageIndex,
          // لما صاروا اكثر من 3 تغير التايب
          //shifting بعطيه لون جسب الايتم يلي بضغط عليه
          type: BottomNavigationBarType.shifting,
          // type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue.shade200,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          /***********************************/
          // اعطي لون للعنصر السليكت
          // لازم وحدة من الثنتين
          // fixedColor: Colors.black,
          selectedLabelStyle: GoogleFonts.montserrat(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            letterSpacing: 2, // ا// تعممت على الكل
            fontSize: 14, // الاثر داخلي بياخذ لانو الاعلى تاثيرا
          ),//
          selectedFontSize: 17,
          //
          // defoult 14
          selectedItemColor: Colors.black,
          selectedIconTheme: IconThemeData(color: Colors.black),
          /**************************************/
          unselectedItemColor: Colors.grey,
          unselectedFontSize: 12,
          // defoult 12
          unselectedIconTheme: IconThemeData(
            color: Colors.grey,
            size: 15, // الاولويه الاكبر على مستوى الثيم
          ),
          unselectedLabelStyle: GoogleFonts.montserrat(
            // غير مشترك هو نوع الخط و الويت
            // مشترك مسافات بين الاحرف
            // لون خط لا بعمل
            fontWeight: FontWeight.bold,
          ),
          // defulte 24
          iconSize: 20,
        
          elevation: 20,
        
          /**********************************/
          items: [
            // كحد ادنى 2
            BottomNavigationBarItem(
              backgroundColor: Colors.blue.shade200,
              activeIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
        
            BottomNavigationBarItem(
              backgroundColor: Colors.yellow.shade200,
              activeIcon: Icon(Icons.person),
              icon: Icon(Icons.person_outlined),
              label: 'Users',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.green.shade200,
              activeIcon: Icon(Icons.category),
              icon: Icon(Icons.category_outlined),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.purple.shade200,
              activeIcon: Icon(Icons.settings),
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
