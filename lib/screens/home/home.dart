import 'package:attendance_app/models/user.dart';
import 'package:attendance_app/screens/admin_screens/admin_bottom_navigation_bar.dart';
import 'package:attendance_app/screens/employee_screens/employee_bottom_navigation_bar.dart';

import 'package:attendance_app/screens/providers/bottom_navigation_bar_provider.dart';
import 'package:attendance_app/services/shared_preference_helper.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user.uid == "s6kMEKcUxrS1Bp6mZ4i07N3PvST2") {
      _setIsAdmin(true);
      return ChangeNotifierProvider<BottomNavigationBarProvider>(
        child: AdminBottomNavigationBar(),
        create: (BuildContext context) => BottomNavigationBarProvider(),
      );
    }
    _setIsAdmin(false);
    return ChangeNotifierProvider<BottomNavigationBarProvider>(
      child: EmployeeBottomNavigationBar(),
      create: (BuildContext context) => BottomNavigationBarProvider(),
    );
  }

  _setIsAdmin(bool isAdmin) async {
    await SharedPreferenceHelper.setIsAdmin(isAdmin);
  }
}
