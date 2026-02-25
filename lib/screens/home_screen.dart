import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamy/common/app_colors.dart';
import 'package:islamy/gen/assets.gen.dart';
import 'package:islamy/tabs/hadeeth_tab/hadeeth_tab_page.dart';
import 'package:islamy/tabs/quran_tab/quran_tab_page.dart';
import 'package:islamy/tabs/radio_tab/radio_tab_page.dart';
import 'package:islamy/tabs/sebha_tab/sebha_tab_page.dart';
import 'package:islamy/tabs/times_tab/times_tab_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currantIndex = 0;
  List<Widget> tabs = [
    QuranTabPage(),
    HadeethTabPage(),
    SebhaTabPage(),
    RadioTabPage(),
    TimesTabPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currantIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currantIndex,
        onTap: (value) {
          currantIndex = value;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items: [
          customBottomNavBarITem(icon: Assets.quranTabIcon, label: "Quran"),

          customBottomNavBarITem(
            icon: (Assets.hadeethTabIcon),
            label: "hadeeth",
          ),
          customBottomNavBarITem(icon: (Assets.sebhaTabIcon), label: "Sebha"),
          customBottomNavBarITem(icon: (Assets.radioTabIcon), label: "Radio"),
          customBottomNavBarITem(icon: (Assets.timesTabIcon), label: "Times"),
        ],
      ),
    );
  }

  BottomNavigationBarItem customBottomNavBarITem({
    required String icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(icon),
      activeIcon: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(66),
          color: AppColors.blackColor.withValues(alpha: .6),
        ),
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
      label: label,
    );
  }
}
