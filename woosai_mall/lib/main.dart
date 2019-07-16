import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:woosai_mall/pages/appPage.dart';
import 'package:woosai_mall/pages/welcome/welcomePage.dart';
import 'package:woosai_mall/pages/login/loginPage.dart';
import 'dart:io';

void main() {
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WoosaiMall',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder> {
        '/': (_) => new WelcomePage(),
        'app': (_) => new AppPage(),
        'login': (_) => new LoginPage(),
      },
    );
  }
}
