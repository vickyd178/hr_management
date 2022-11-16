import 'package:flutter/material.dart';
import 'package:hr_management/common/app_color.dart';
import 'package:hr_management/common/dimensions.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(Dimensions.getHeight(1.0)),
      ),
      padding: EdgeInsets.all(Dimensions.getHeight(1.0)),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Image.asset(
                  "assets/user1.jpg",
                  height: Dimensions.getHeight(6.0),
                  width: Dimensions.getHeight(6.0),
                ),
              ),
              SizedBox(
                width: Dimensions.getHeight(1.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Emma Watson",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.getFontSize(1.4)),
                  ),
                  Text(
                    "HR Manager",
                    style: TextStyle(fontSize: Dimensions.getFontSize(1.4)),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            thickness: Dimensions.getHeight(0.05),
            color: Colors.grey,
          ),
          profileListTile("Joined Date", "18 Apr, 2021"),
          profileListTile("Projects", "32 Active"),
          profileListTile("Accomplishments", "125"),
        ],
      ),
    );
  }
}

Widget profileListTile(text, value) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: Dimensions.getHeight(0.8)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: Dimensions.getHeight(1.4),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.black,
            fontSize: Dimensions.getHeight(1.4),
          ),
        ),
      ],
    ),
  );
}
