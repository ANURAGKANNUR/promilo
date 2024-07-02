import 'package:flutter/material.dart';
import 'package:promilo_test/home_screen/views/home_screen.dart';
import 'package:promilo_test/home_screen/views/test_screen.dart';
import 'package:promilo_test/utils/app_colors.dart';
import 'package:promilo_test/utils/text_styles.dart';

class HomeNavBar extends StatefulWidget {
  const HomeNavBar({super.key});

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
  @override
  void initState() {
    super.initState();
    selectedIndex.value = 2;
  }

  ValueNotifier<int> selectedIndex = ValueNotifier(0);

  List<Widget> pages = [
    const MyWidget(),
    const MyWidget(),
    const HomeScreen(),
    const MyWidget(),
    const MyWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: selectedIndex,
          builder: (context, value, child) {
            return PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: pages.length,
              onPageChanged: (value) {
                selectedIndex.value = value;
              },
              itemBuilder: (context, index) {
                return pages[value];
              },
            );
          }),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ValueListenableBuilder(
            valueListenable: selectedIndex,
            builder: (context, value, child) {
              return BottomNavigationBar(
                // fixedColor: Colors.black,
                unselectedItemColor: Colors.black,
                selectedItemColor: AppColors.secondaryBlue,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                unselectedLabelStyle: TextStyles.textStyleBold12,
                items: [
                  BottomNavigationBarItem(
                    activeIcon: Image.asset(
                      'assets/home_icon.png',
                      color: AppColors.secondaryBlue,
                      height: 25,
                      width: 25,
                    ),
                    icon: Image.asset(
                      'assets/home_icon.png',
                      height: 25,
                      width: 25,
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/prolate_icon.png',
                        height: 26,
                        width: 30,
                      ),
                      activeIcon: Image.asset(
                        'assets/prolate_icon.png',
                        height: 26,
                        width: 30,
                        color: AppColors.secondaryBlue,
                      ),
                      label: "Prolet"),
                  BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/shake_hand.png',
                        height: 26,
                        width: 30,
                      ),
                      activeIcon: Image.asset(
                        'assets/shake_hand.png',
                        height: 26,
                        width: 30,
                        color: AppColors.secondaryBlue,
                      ),
                      label: "Meetup"),
                  BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/explore.png',
                        height: 22,
                        width: 25,
                      ),
                      activeIcon: Image.asset(
                        'assets/explore.png',
                        height: 22,
                        color: AppColors.secondaryBlue,
                        width: 25,
                      ),
                      label: "Explore"),
                  BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/profile.png',
                        height: 22,
                        width: 25,
                      ),
                      activeIcon: Image.asset(
                        'assets/profile.png',
                        height: 22,
                        color: AppColors.secondaryBlue,
                        width: 25,
                      ),
                      label: "Account"),
                ],
                currentIndex: value,
                onTap: (value) {
                  selectedIndex.value = value;
                },
              );
            }),
      ),
    );
  }
}
