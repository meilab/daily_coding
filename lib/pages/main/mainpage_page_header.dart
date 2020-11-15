import 'package:daily_coding/routers/route_manager.dart';
import 'package:flutter/material.dart';

class MainPagePageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          height: kToolbarHeight,
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  RouterManager.router.navigateTo(context, "/search");
                },
                child: Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Hero(
                    tag: 'search',
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  RouterManager.router.navigateTo(context, "/collect");
                },
                child: Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Icon(
                    Icons.star_half,
                    color: Colors.white,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  RouterManager.router.navigateTo(context, "/settings");
                },
                child: Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  RouterManager.router.navigateTo(context, "/profile");
                },
                child: Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: kToolbarHeight / 3),
        Center(
          child: Image.asset(
            'assets/images/logo.png',
            height: MediaQuery.of(context).size.height * 0.2,
          ),
        ),
      ],
    );
  }
}
