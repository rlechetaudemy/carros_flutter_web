
import 'package:carros_flutter_web/app_model.dart';
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
    AppModel app = Provider.of<AppModel>(context);

    return ListView.builder(
        itemCount: app.pages.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, idx){

          Widget page = app.pages[idx];

          if(idx == 0) {
            return Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.home),
                Text("Home")
              ],
            );
          }

          return Center(child: Text(" > ${page.runtimeType}"));
    });
  }
}
