import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/common/app_color.dart';
import 'package:hr_management/common/app_responsive.dart';
import 'package:hr_management/common/dimensions.dart';

class NotificationCardWidget extends StatelessWidget {
  const NotificationCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.getHeight(2.0)),
      decoration: BoxDecoration(
          color: AppColor.yellow,
          borderRadius: BorderRadius.circular(Dimensions.getBorderRadius(2.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                        fontSize: Dimensions.getHeight(1.6),
                        color: AppColor.black),
                    children: const [
                      TextSpan(
                        text: "Good Morning ",
                      ),
                      TextSpan(
                        text: "Doops!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimensions.getHeight(1.0),
                ),
                Text(
                  "Today you have 9 Applications. Also you need to hire 2 new UX designers, 1 React Developer, 1 Flutter Developer And HR Manager.",
                  style: TextStyle(
                    fontSize: Dimensions.getFontSize(1.4),
                    color: AppColor.black,
                    height: 1.5,
                  ),
                ),
                SizedBox(
                  height: Dimensions.getHeight(1.0),
                ),
                Text(
                  "Read More",
                  style: TextStyle(
                    fontSize: Dimensions.getHeight(1.4),
                    color: AppColor.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            ),
          ),
          if (AppResponsive.isDesktop(context)) ...{
            Expanded(
              child: Image.asset(
                "assets/notification_image.png",
                height: Dimensions.getHeight(12.0),
              ),
            ),
          }
        ],
      ),
    );
  }
}
