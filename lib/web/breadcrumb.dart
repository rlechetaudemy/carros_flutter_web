import 'package:carros_flutter_web/app_model.dart';
import 'package:carros_flutter_web/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class BreadCrumb extends StatefulWidget {
  @override
  _BreadCrumbState createState() => _BreadCrumbState();
}

class _BreadCrumbState extends State<BreadCrumb> {
  @override
  Widget build(BuildContext context) {
    PagesModel app = Provider.of<PagesModel>(context);

    return ListView.builder(
      itemCount: app.pages.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        PageInfo info = app.pages[index];

        return InkWell(
          onTap: () => _onClickPage(index),
          child: Row(
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints.expand(width: 32),
                child: Icon(
                  index == 0
                      ? FontAwesomeIcons.home
                      : FontAwesomeIcons.chevronRight,
                  color: AppColors.blue,
                ),
              ),
              Text(
                info.title,
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        );
      },
    );
  }

  _onClickPage(int index) {
    PagesModel app = Provider.of<PagesModel>(context);

    if (index == 0) {
      app.popAll();
    } else {
      app.popTo(index);
    }
  }
}
