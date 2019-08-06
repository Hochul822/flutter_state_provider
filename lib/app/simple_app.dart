import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SimpleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<int>.value(
      value: 5,
      child: MaterialApp(
        home: SimplePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class SimplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<int>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Simple app'),
      ),
      body: Center(
        child: Text('${data}', style: TextStyle(fontSize: 24.0),),
      ),
    );
  }
}
