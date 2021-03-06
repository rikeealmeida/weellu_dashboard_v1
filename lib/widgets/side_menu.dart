import 'package:dashboard_v1/constants/controllers.dart';
import 'package:dashboard_v1/constants/style.dart';
import 'package:dashboard_v1/helpers/responsiveness.dart';
import 'package:dashboard_v1/pages/authentication/authentication.dart';
import 'package:dashboard_v1/routing/routes.dart';
import 'package:dashboard_v1/widgets/custom_text.dart';
import 'package:dashboard_v1/widgets/side_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      color: bgColor,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    SizedBox(width: _width / 48),
                    const Padding(
                      padding: EdgeInsets.only(right: 12),
                      // child: Image.asset('assets/icons/6.png', width: 50),
                      child: CircleAvatar(),
                    ),
                    Flexible(
                        child: CustomText(
                            text: 'Dashboard',
                            size: 20,
                            weight: FontWeight.bold,
                            color: active)),
                    SizedBox(width: _width / 48),
                  ],
                ),
              ],
            ),
          Divider(color: lightGrey.withOpacity(.1)),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItems
                .map((item) => SideMenuItem(
                      itemName: item.name,
                      onTap: () {
                        if (item.route == AuthenticationPageRoute) {
                          menuController
                              .changeActiveitemTo(OverViewPageDisplayName);
                          Get.offAllNamed(AuthenticationPageRoute);
                        }
                        if (!menuController.isActive(item.name)) {
                          menuController.changeActiveitemTo(item.name);
                          if (ResponsiveWidget.isSmallScreen(context)) {
                            Get.back();
                          }
                          navigationController.navigateTo(item.route);
                        }
                      },
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
