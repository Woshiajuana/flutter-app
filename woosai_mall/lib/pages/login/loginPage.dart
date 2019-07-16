
import 'package:flutter/material.dart';
import 'package:woosai_mall/pages/login/components/headerGroup.dart';
import 'package:woosai_mall/pages/login/components/inputGroup.dart';
import 'package:woosai_mall/pages/login/components/buttonGroup.dart';
import 'package:woosai_mall/common/utils/apiUtil.dart';
import 'package:woosai_mall/common/utils/storeUtil.dart';
import 'package:woosai_mall/common/utils/routerUtil.dart';

class LoginPage extends StatefulWidget {

  static final String sName = 'login';

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String _username = '13127590698';
  String _password = '111111';
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new HeaderGroup(),
          new InputGroup(
            username: _username,
            password: _password,
            usernameChange: (value) => this.setState(() => _username = value),
            passwordChange: (value) => this.setState(() => _password = value),
          ),
          new ButtonGroup(
            onTap: () => _handleSubmit(),
          ),
        ],
      ),
    );
  }

  // 提交
  void _handleSubmit() async {
    var respBody = await ApiUtil.userLogin(_username, _password);
    if (respBody == null) return;
    print('login page => $respBody');
    await StoreUtil.save(StoreUtil.USER_INFO, respBody);
    RouterUtil.pushApp(context);
  }
}