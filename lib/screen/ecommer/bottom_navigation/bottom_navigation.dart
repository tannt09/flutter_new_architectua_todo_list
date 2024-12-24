import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/constants/colors.dart';
import 'package:flutter_new_architectua/screen/ecommer/cart/cart_screen.dart';
import 'package:flutter_new_architectua/screen/ecommer/home/home_screen.dart';
import 'package:flutter_new_architectua/screen/ecommer/search/search_screen.dart';
import 'package:flutter_new_architectua/screen/ecommer/profile/profile_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    CartPage(showBackButton: false),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/home_icon.svg',
                  height: 25,
                  width: 25,
                  colorFilter: _selectedIndex == 0
                      ? const ColorFilter.mode(AppColors.main, BlendMode.srcIn)
                      : const ColorFilter.mode(
                          AppColors.grey, BlendMode.srcIn)),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/search_icon.svg',
                  height: 25,
                  width: 25,
                  colorFilter: _selectedIndex == 1
                      ? const ColorFilter.mode(AppColors.main, BlendMode.srcIn)
                      : const ColorFilter.mode(
                          AppColors.grey, BlendMode.srcIn)),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/cart_icon.svg',
                  height: 25,
                  width: 25,
                  colorFilter: _selectedIndex == 2
                      ? const ColorFilter.mode(AppColors.main, BlendMode.srcIn)
                      : const ColorFilter.mode(
                          AppColors.grey, BlendMode.srcIn)),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/profile_icon.svg',
                  height: 25,
                  width: 25,
                  colorFilter: _selectedIndex == 3
                      ? const ColorFilter.mode(AppColors.main, BlendMode.srcIn)
                      : const ColorFilter.mode(
                          AppColors.grey, BlendMode.srcIn)),
              label: ''),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: AppColors.main2,
      ),
    );
  }
}
