import 'package:flutter/material.dart';

class MenuController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _globalKey;

  void controilMenu() {
    bool open = _globalKey.currentState?.isDrawerOpen ?? false;
    if (!open) {
      _globalKey.currentState?.openDrawer();
    } else {
      _globalKey.currentState?.openEndDrawer();
    }
  }

  double screenHeight(double screenHeight) {
    return screenHeight;
  }
}
