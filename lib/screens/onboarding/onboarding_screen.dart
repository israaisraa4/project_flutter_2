import 'package:flutter/material.dart';
import 'package:project_flutter/widgets/on_boarding_content.dart';
import 'package:project_flutter/widgets/page_view_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}
// عرف متبع في انشاء الكونترولرز يتم انشاءها في init و هدمها في dispose

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // dispose الغاء الاستماع و التتتبع
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // اذا وضع عنصر داخل كولومم وكان هذا العنصر تمدده اكبر من امكانيه الكولوم بعمل اله حجم
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Visibility(
                visible: _currentPage < 2,
                replacement: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login_screen');
                  },
                  child: Text('Start'),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    _pageController.animateToPage(
                      2,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOutBack,
                    );
                  },
                  child: Text(
                    'skip',
                    style: TextStyle(color: Colors.blue),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                // بتحكم بالسكرول من خلالها يمكن اوقف السكرول
                // اسلوب الانميشن اله عدة محاور
                //  نقطة البدايه تتناسب مع نوع الحركة و طبيعه السكرولين
                //ClampingScrollPysics لما اجي ارجع ما بلاقي مساحه يلي في الاخر بظهر اشي ازرق
                physics: BouncingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (int currentPage) {
                  setState(() {
                    _currentPage = currentPage;
                  });
                },
                // اتجاه السكرول
                scrollDirection: Axis.horizontal,
                children: [
                  const OnBoardingContent(
                    image: 'img',
                    title: 'Welcome!',
                    subTitle:
                        'hello to my App Israa Lubbad it\'s very butfual application!',
                  ),
                  const OnBoardingContent(
                    image: 'img_1',
                    title: 'Add to cart',
                    subTitle:
                        'hello to my App Israa Lubbad it\'s very butfual application!',
                  ),
                  const OnBoardingContent(
                    image: 'img_2',
                    title: 'Enjoy Purchase!',
                    subTitle:
                        'hello to my App Israa Lubbad it\'s very butfual application!',
                  ),

                  // ماخ ذ الجم كامل
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PageViewIndicator(
                  isCurrentPage: _currentPage == 0,
                  marginEnd: 15,
                ),
                PageViewIndicator(
                  isCurrentPage: _currentPage == 1,
                  marginEnd: 15,
                ),
                PageViewIndicator(isCurrentPage: _currentPage == 2),
              ],
            ),

            // شكل دائري
            //      Row(
            //        mainAxisAlignment: MainAxisAlignment.center,
            //        children: [
            //         TabPageSelectorIndicator(
            //             backgroundColor: _currentPage == 0 ? Colors.blue :Colors.grey ,
            //             borderColor: _currentPage == 0 ? Colors.orange :Colors.transparent, size: 10),
            //          TabPageSelectorIndicator(
            //              backgroundColor: _currentPage == 1 ? Colors.blue :Colors.grey ,
            //              borderColor: _currentPage == 1 ? Colors.orange :Colors.transparent, size: 10),
            //          TabPageSelectorIndicator(
            //              backgroundColor: _currentPage == 2 ? Colors.blue :Colors.grey ,
            //              borderColor: _currentPage == 2 ? Colors.orange :Colors.transparent, size: 10),
            //
            //
            // ],
            //      ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    if (_currentPage > 0) {
                      _pageController.previousPage(
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInBack,
                      );
                    }
                  },
                  icon:const Icon(Icons.arrow_back_ios),
                ),
                IconButton(
                  onPressed: () {
                    if (_currentPage < 2) {
                      _pageController.nextPage(
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOutBack,
                      );
                    }
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
            SizedBox(height: 30),
            Visibility(
              // ما يصير يطلع و يزنل  لازم 3  احافظ على مساحة العنصر
              maintainState: true,
              maintainAnimation: true,
              maintainSize: true,
              visible: _currentPage == 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  decoration: BoxDecoration(
                    // ميشان اعمل حواف
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [Color(0xFFA6D1E6), Color(0xFFFEFBF6)],
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login_screen');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      minimumSize: Size(double.infinity, 50),

                      // shape: BeveledRectangleBorder(
                      //   borderRadius: BorderRadius.circular(15)
                      // )
                    ),
                    child:const Text('Start'),
                  ),
                ),
              ),
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
