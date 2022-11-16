import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/common/app_color.dart';
import 'package:hr_management/common/app_responsive.dart';
import 'package:hr_management/common/dimensions.dart';
import 'package:hr_management/controllers/menu_controller.dart';
import 'package:provider/provider.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: AppColor.bgSideMenu,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: Dimensions.getHeight(3.0),
                    bottom: Dimensions.getHeight(1.0),
                    left: Dimensions.getHeight(2.0),
                    right: Dimensions.getHeight(2.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "MATRIX HR",
                        style: TextStyle(
                            color: AppColor.yellow,
                            fontSize: Dimensions.getFontSize(2.5),
                            fontWeight: FontWeight.bold),
                      ),
                      if (!AppResponsive.isDesktop(context))
                        IconButton(
                          onPressed: Provider.of<MenuController>(context,
                                  listen: false)
                              .controlMenu,
                          icon: Icon(
                            Icons.close,
                            color: AppColor.white,
                            size: Dimensions.getIconSize(2.4),
                          ),
                        )
                    ],
                  ),
                ),
                DrawerListTile(
                    title: "Dashboard", icon: Icons.home, press: () {}),
                DrawerListTile(
                    title: "Recruitment",
                    icon: Icons.people_alt_sharp,
                    press: () {}),
                DrawerListTile(
                    title: "Onboarding",
                    icon: Icons.insert_drive_file_rounded,
                    press: () {}),
                DrawerListTile(
                    title: "Reports",
                    icon: Icons.bar_chart_rounded,
                    press: () {}),
                DrawerListTile(
                    title: "Calendar",
                    icon: Icons.calendar_month_rounded,
                    press: () {}),
                DrawerListTile(
                    title: "Settings", icon: Icons.settings, press: () {}),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(),
                Image.asset(
                  "assets/sidebar_image.png",
                  height: Dimensions.getHeight(16.0),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback press;

  const DrawerListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      minLeadingWidth: Dimensions.getHeight(1.5),
      leading: Icon(
        icon,
        color: AppColor.white,
        size: Dimensions.getIconSize(2.4),
      ),
      title: Text(
        title,
        style: TextStyle(
            color: AppColor.white, fontSize: Dimensions.getFontSize(1.4)),
      ),
    );
  }
}
