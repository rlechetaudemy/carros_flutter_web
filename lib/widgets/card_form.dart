import 'package:carros_flutter_web/imports.dart';

// Card usado nas telas de login e esqueci a senha com template do formulário
class CardForm extends StatelessWidget {
  final String title;
  final Widget child;

  CardForm({@required this.title, @required this.child});

  @override
  Widget build(BuildContext context) {
    bool small = smallScreen(context);

    return Center(
      child: Container(
        width: small ? double.infinity : 457,
        height: small ? double.infinity : 500,
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

    if (smallScreen(context)) {
      return Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: text(
            "$title",
            fontSize: 25,
            bold: true,
          ),
        ),
      );
    } else {
      return Container(
        height: 76,
        decoration: BoxDecoration(
          color: AppColors.cinza_606060,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Center(
          child: text(
            "$title",
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      );
    }
  }
}
