import 'package:carros_flutter_web/imports.dart';

import 'chart1.dart';
import 'chart2.dart';
import 'chart3.dart';
import 'chart4.dart';

class ChartsPage extends StatefulWidget {
  @override
  _ChartsPageState createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return LayoutBuilder(
      builder: (context, constraints) {
        int columns = 2;

        return Container(
          padding: EdgeInsets.all(16),
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              childAspectRatio: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            children: <Widget>[
              _card1(),
              _card2(),
              _card3(),
              _card4(),
            ],
          ),
        );
      },
    );
  }

  _card1() {
    return Container(
      child: GroupedStackedWeightPatternBarChart.withSampleData(),
    );
  }

  _card2() {
    return Container(
      child: StackedAreaLineChart.withSampleData(),
    );
  }

  _card3() {
    return Container(
      child: DonutAutoLabelChart.withSampleData(),
    );
  }

  _card4() {
    return Container(
      child: OrdinalComboBarLineChart.withSampleData(),
    );
  }
}
