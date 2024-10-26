// ignore_for_file: flutter_style_todos

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:result_e/app_router.dart';
import 'package:result_e/core/theme/colors.dart';

///
class BaseScreen extends StatelessWidget {
  /// Constructs an [BaseScreen].
  const BaseScreen({
    required this.child,
    super.key,
  });

  ///
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: primaryColor,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: whiteColor,
          unselectedItemColor: backgroundColor,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedFontSize: 14,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'Result',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_emergency_sharp),
              label: 'Exam',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_open_rounded),
              label: 'More',
            ),
          ],
          currentIndex: _calculateSelectedIndex(context),
          onTap: (int idx) => _onItemTapped(idx, context),
        ),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(AppRouter.homeScreen)) {
      return 0;
    }
    if (location.startsWith(AppRouter.resultScreen)) {
      return 1;
    }
    if (location.startsWith(AppRouter.examScreen)) {
      return 2;
    }
    if (location.startsWith(AppRouter.moreScreen)) {
      return 3;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(AppRouter.homeScreen);
      case 1:
        context.go(AppRouter.resultScreen);
      case 2:
        context.go(AppRouter.examScreen);
      case 3:
        context.go(AppRouter.moreScreen);
    }
  }
}
