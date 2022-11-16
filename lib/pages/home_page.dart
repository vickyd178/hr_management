import 'package:flutter/material.dart';
import 'package:hr_management/common/app_color.dart';
import 'package:hr_management/common/app_responsive.dart';
import 'package:hr_management/common/dimensions.dart';
import 'package:hr_management/controllers/menu_controller.dart';
import 'package:hr_management/pages/dashboard/Dashboard.dart';
import 'package:hr_management/pages/widgets/side_bar_menu.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Dimensions.screenHeight = MediaQuery.of(context).size.height;
    print("Screen Height: "+Dimensions.screenHeight.toString());
    print("Screen Width: "+MediaQuery.of(context).size.width.toString());
    return Scaffold(
      drawer: SideBar(),
      key: Provider.of<MenuController>(context, listen: false).scaffoldKey,
      backgroundColor: AppColor.bgSideMenu,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Side Navigation bar
            //Only show in desktop

            if (AppResponsive.isDesktop(context))
              const Expanded(
                child: SideBar(),
              ),
            //Main body part
            const Expanded(
              flex: 4,
              child: Dashboard(),
            ),
          ],
        ),
      ),
    );
  }
}
