import 'package:event_planner/common/app_colors.dart';
import 'package:event_planner/common/app_strings.dart';
import 'package:event_planner/common/app_text_styles.dart';
import 'package:event_planner/presentation/screens/home_page.dart';
import 'package:event_planner/presentation/screens/profile_page.dart';
import 'package:event_planner/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(AppColors.fontBlack),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/svg/home.svg', color: _currentIndex == 0 ? Colors.deepOrange : Colors.grey),
            label: AppStrings.home,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/svg/more.svg', color: _currentIndex == 1 ? Colors.deepOrange : Colors.grey),
            label: AppStrings.profile,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: Container(
                            width: 44.sp,
                            height: 44.sp,
                            child: Image.network(
                                'https://s3-alpha-sig.figma.com/img/bb5a/b1e2/6f5aebe7f96f23f10603fcdf8c868631?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=GI8GnqbycxMmUgw0gTJ5-vrYEO-nlH8qQp0R8llxqDJYt0o9QqZwKecY3R9d5jzxFAvVh3EJdBrZhk4pQiRjtEMeswncDr1lSeWbJ1IqwujMc5SAXzS5I7h-5~w1iSpqwubIaNGjsJod723LSoAwjX0lX5ZrVjXGM3ffLmmOl18ojb1Ii9lPUC074ybRqg4IbwcGM2bBjsw3nia4EdPgz-jItH4BrUpWB5VH0hsqoIdZdwqx7naYHj7oGg8VOOnjCAFiaHBT8J-teHFCROHi9TSfIDr32K~ZjL1rq0iiQvqjKueiUHXrL9saDJ1cKi2XQCTAtkaVBI48rtPTQtsK5w__'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.sp),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('James Anderson', style: AppStyling.w400size16),
                        Text('james@gmail.com', style: AppStyling.w400size14),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                // AuthenticationService().signOut();
                Navigator.pushNamed(context, Routes.login);
                // Handle logout
              },
            ),
          ],
        ),
      ),
      body: SafeArea(child: _screens[_currentIndex]),
    );
  }
}
