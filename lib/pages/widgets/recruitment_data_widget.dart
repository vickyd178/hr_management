import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr_management/common/app_color.dart';
import 'package:hr_management/common/app_responsive.dart';
import 'package:hr_management/common/dimensions.dart';

class RecruitmentDataWidget extends StatefulWidget {
  const RecruitmentDataWidget({Key? key}) : super(key: key);

  @override
  State<RecruitmentDataWidget> createState() => _RecruitmentDataWidgetState();
}

class _RecruitmentDataWidgetState extends State<RecruitmentDataWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(Dimensions.getBorderRadius(2.0)),
      ),
      padding: EdgeInsets.all(Dimensions.getHeight(1.0)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Recruitment Progress",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.getFontSize(2.0),
                    color: AppColor.black,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColor.yellow,
                    borderRadius: BorderRadius.circular(100)),
                padding: EdgeInsets.symmetric(
                  vertical: Dimensions.getHeight(1.0),
                  horizontal: Dimensions.getHeight(2.0),
                ),
                child: Text(
                  "View All",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.black,
                      fontSize: Dimensions.getFontSize(1.4)),
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              //Table Header
              TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                  ),
                  children: [
                    tableHeader("Full Name"),
                    if (!AppResponsive.isMobile(context))
                      tableHeader("Designation"),
                    tableHeader("Status"),
                    if (AppResponsive.isDesktop(context)) tableHeader(""),
                  ]),

              //Table Data
              tableRow(
                context,
                name: "Marry G Lolus",
                color: Colors.green,
                image: "assets/user1.jpg",
                disignation: "Project Manager",
                status: "Protocol Round",
              ),
              tableRow(
                context,
                name: "Nell Brian",
                color: Colors.blue,
                image: "assets/user2.jpg",
                disignation: "UI/UX Developer",
                status: "HR Round",
              ),
              tableRow(
                context,
                name: "Tobey Maguire",
                color: Colors.red,
                image: "assets/user3.jpg",
                disignation: "React Developer",
                status: "Final Round",
              ),
              tableRow(
                context,
                name: "Revichandra Ashwin",
                color: Colors.green,
                image: "assets/user4.jpg",
                disignation: "Flutter Developer",
                status: "Final Round",
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.getHeight(0.5),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: Dimensions.getHeight(1.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Showing 4 out of 4 Results",
                  style: TextStyle(
                    fontSize: Dimensions.getFontSize(1.4),
                  ),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.getFontSize(1.4)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

TableRow tableRow(context, {name, image, disignation, status, color}) {
  return TableRow(
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
    ),
    children: [
      //Full Name
      Container(
        margin: EdgeInsets.symmetric(vertical: Dimensions.getHeight(1.5)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: Image.asset(
                image,
                width: Dimensions.getHeight(3.0),
              ),
            ),
            SizedBox(
              width: Dimensions.getHeight(1.5),
            ),
            Expanded(
                child: Text(
              name,
              overflow: TextOverflow.clip,
              style: TextStyle(fontSize: Dimensions.getFontSize(1.4)),
            )),
          ],
        ),
      ),
      //Disignation
      if (!AppResponsive.isMobile(context))
        Expanded(
          child: Text(
            disignation,
            overflow: TextOverflow.fade,
            style: TextStyle(fontSize: Dimensions.getFontSize(1.4)),
          ),
        ),
      //Status
      Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            height: Dimensions.getHeight(1.0),
            width: Dimensions.getHeight(1.0),
          ),
          SizedBox(
            width: Dimensions.getHeight(1.0),
          ),
          Expanded(
            child: Text(
              status,
              style: TextStyle(fontSize: Dimensions.getFontSize(1.4)),
            ),
          ),
        ],
      ),
      if (AppResponsive.isDesktop(context))
        Image.asset(
          "assets/more.png",
          color: Colors.grey,
          height: Dimensions.getHeight(2.0),
        )
    ],
  );
}

Widget tableHeader(text) {
  return Container(
    margin: EdgeInsets.symmetric(
      vertical: Dimensions.getHeight(1.5),
    ),
    child: Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, color: AppColor.black),
    ),
  );
}
