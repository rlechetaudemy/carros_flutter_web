import 'package:carros_flutter_web/imports.dart';

fontSize(double value, {double min = 8, double max = 22}) {
  return size(value, min: min, max: max);
}

size(double value, {double min = 0, double max = double.infinity}) {
  if (value < min) {
    return min;
  }
  if (value > max) {
    return max;
  }
  return value;
}

smallScreen(context) {
  Size size = MediaQuery.of(context).size;
  return size.width <= 500;
}
