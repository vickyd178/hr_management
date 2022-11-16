import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/common/app_color.dart';
import 'package:hr_management/common/app_responsive.dart';
import 'package:hr_management/common/dimensions.dart';
import 'package:hr_management/controllers/menu_controller.dart';
import 'package:provider/provider.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!AppResponsive.isDesktop(context))
            IconButton(
              icon: Icon(
                Icons.menu,
                color: AppColor.black,
                size: Dimensions.getIconSize(2.4),
              ),
              onPressed: Provider.of<MenuController>(context, listen: false)
                  .controilMenu,
            ),
          Text(
            "Dashboard",
            style: TextStyle(
              fontSize: Dimensions.getFontSize(2.4),
              fontWeight: FontWeight.bold,
            ),
          ),
          if (!AppResponsive.isMobile(context)) ...{
            const Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                navigationIcon(icon: Icons.search),
                navigationIcon(icon: Icons.send),
                navigationIcon(icon: Icons.notifications_none_rounded),
              ],
            )
          }
        ],
      ),
    );
  }
}

Widget navigationIcon({icon}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Icon(
      icon,
      color: AppColor.black,
      size: Dimensions.getIconSize(2.4),
    ),
  );
}
