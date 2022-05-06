import 'package:dashboard_v1/constants/controllers.dart';
import 'package:dashboard_v1/constants/style.dart';
import 'package:dashboard_v1/helpers/responsiveness.dart';
import 'package:dashboard_v1/routing/routes.dart';
import 'package:dashboard_v1/widgets/custom_text.dart';
import 'package:dashboard_v1/widgets/side_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 40),
                Row(
                  children: [
                    SizedBox(width: _width / 48),
                    Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: Image.asset(
                          'assets/icons/6.png',
                          width: 50,
                        )),
                    Flexible(
                        child: CustomText(
                            text: 'Weellu',
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
                .map((itemName) => SideMenuItem(
                      itemName: itemName == AuthenticationPageRoute
                          ? 'Logout'
                          : itemName,
                      onTap: () {
                        if (itemName == AuthenticationPageRoute) {}
                        if (!menuController.isActive(itemName)) {
                          menuController.changeActiveitemTo(itemName);
                          if (ResponsiveWidget.isSmallScreen(context))
                            Get.back();
                          navigationController.navigateTo(itemName);
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