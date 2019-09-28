import 'package:carros_flutter_web/utils/web/prefs.dart';
import 'package:flutter/material.dart';

class PrefsPage extends StatefulWidget {

  @override
  _PrefsPageState createState() => _PrefsPageState();
}

class _PrefsPageState extends State<PrefsPage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();

//    _counter = Prefs.getInt("count");
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      Prefs.setInt("count",_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

}
