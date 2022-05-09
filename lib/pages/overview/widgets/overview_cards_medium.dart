import 'package:dashboard_template/pages/overview/widgets/info_card.dart';
import 'package:flutter/material.dart';

class OverviewcardsMediumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            InfoCard(
              title: 'Rides in progress',
              value: "7",
              onTap: () {},
              topColor: Colors.orange,
            ),
            SizedBox(
              width: _width / 64,
            ),
            InfoCard(
              title: 'Packages delivered',
              value: "17",
              onTap: () {},
              topColor: Colors.lightGreen,
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            InfoCard(
                title: 'Cancelled delivery',
                value: "3",
                onTap: () {},
                topColor: Colors.redAccent),
            SizedBox(
              width: _width / 64,
            ),
            InfoCard(
              title: 'Sheduled deliveries',
              value: "3",
              onTap: () {},
            ),
          ],
        )
      ],
    );
  }
}
