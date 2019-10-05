import 'package:carros_flutter_web/imports.dart';
import 'dart:html';

// Card usado nas telas de login e esqueci a senha com template do formulário
class CardForm extends StatelessWidget {
  String title;
  Widget child;

  CardForm({@required this.title, @required this.child});

  @override
  Widget build(BuildContext context) {
    bool small = smallScreen(context);
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        width: small ? double.infinity : 457,
        height: small ? double.infinity : 460,
        decoration: BoxDecoration(
          color: AppColors.cinza_background,
          borderRadius: small ? null : BorderRadius.circular(12),
        ),
        child: Column(
          children: <Widget>[
            _title(context),
            Container(
              padding: EdgeInsets.all(16),
              child: child,
            ),
          ],
        ),
      ),
    );
  }

  _title(context) {
    Size size = MediaQuery.of(context).size;

    if (smallScreen(context)) {
      return Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text(
            "$title: ${size.width}/${size.height}",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.cinza_606060,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        height: 76,
        child: Center(
          child: Text(
            "$title: ${size.width}/${size.height}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
      );
    }
  }
}
