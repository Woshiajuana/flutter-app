
import 'package:flutter/material.dart';
import 'package:woosai_mall/common/utils/storeUtil.dart';
import 'package:woosai_mall/common/utils/routerUtil.dart';

class WelcomePage extends StatefulWidget {

  @override
  _WelcomePageState createState() => new _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var userInfo = await StoreUtil.get(StoreUtil.USER_INFO);
    print('userInfo => $userInfo');
  }


  void _judgeUserStatus () async {
    var userInfo = await StoreUtil.get(StoreUtil.USER_INFO);
    print('userInfo => $userInfo');
    if (userInfo == null)
      RouterUtil.pushLogin(context);
    new Future.delayed(const Duration(seconds: 1), () async {

    });
  }

  @override
  Widget build(BuildContext context) {
    _judgeUserStatus();
    return SafeArea(
      top: false,
      bottom: false,
      child: new Image(
        fit: BoxFit.fill,
        image: new AssetImage('assets/images/launch_image.png')),
    );
  }
}