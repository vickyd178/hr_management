import 'package:flutter/material.dart';
import 'package:hr_management/common/app_color.dart';
import 'package:hr_management/common/app_responsive.dart';
import 'package:hr_management/common/dimensions.dart';
import 'package:hr_management/pages/widgets/calendar_widget.dart';
import 'package:hr_management/pages/widgets/header_widget.dart';
import 'package:hr_management/pages/widgets/notification_card_widget.dart';
import 'package:hr_management/pages/widgets/profile_card_widget.dart';
import 'package:hr_management/pages/widgets/recruitment_data_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: Dimensions.getHeight(0.5),
          left: Dimensions.getHeight(1),
          right: Dimensions.getHeight(1),
          bottom: Dimensions.getHeight(0.5)),
      margin: AppResponsive.isMobile(context)
          ? EdgeInsets.all(0)
          : EdgeInsets.all(Dimensions.getHeight(1.0)),
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: AppResponsive.isMobile(context)
            ? BorderRadius.circular(0)
            : AppResponsive.isTablet(context)
                ? BorderRadius.circular(Dimensions.getBorderRadius(1.5))
                : BorderRadius.circular(Dimensions.getBorderRadius(3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Header Part
          HeaderWidget(),
          //body
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        children: [
                          NotificationCardWidget(),
                          SizedBox(
                            height: Dimensions.getHeight(2.0),
                          ),
                          if (AppResponsive.isMobile(context)) ...{
                            CalendarWidget(),
                            SizedBox(
                              height: Dimensions.getHeight(2.0),
                            ),
                          },
                          RecruitmentDataWidget(),
                          if (AppResponsive.isMobile(context)) ...{
                            SizedBox(
                              height: Dimensions.getHeight(2.0),
                            ),
                            ProfileCardWidget(),
                            SizedBox(
                              height: Dimensions.getHeight(2.0),
                            ),
                          }
                        ],
                      ),
                    ),
                  ),
                  if (!AppResponsive.isMobile(context))
                    Expanded(
                      child: Container(
                        margin:
                            EdgeInsets.only(left: Dimensions.getHeight(1.0)),
                        child: Column(
                          children: [
                            //Calendar
                            CalendarWidget(),
                            SizedBox(
                              height: Dimensions.getHeight(2.0),
                            ),
                            ProfileCardWidget(),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
