import 'package:carros_flutter_web/imports.dart';

class TextError extends StatelessWidget {
  final String msg;

  TextError(this.msg);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        msg,
        style: TextStyle(
          color: Colors.red,
          fontSize: 22,
        ),
      ),
    );
  }
}
