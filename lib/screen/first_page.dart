import 'package:flutter/material.dart';
import 'package:flutter_state_provider/model/counter.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('first page'),
      ),
      body: Center(
        child: Container(
          child: Text('first page counter ${counter.getCounter()}'),
        ),
      ),
    );
  }
}
