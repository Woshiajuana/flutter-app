
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('首页'),
      ),
      body: new Container(
        child: new Text('这是首页！'),
      ),
    );
  }
}