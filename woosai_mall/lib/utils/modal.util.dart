

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Modal {

  static final Modal _modal = Modal._internal();

  factory Modal () {
    return _modal;
  }

  Modal._internal();

  void toast (msg, {ToastGravity gravity = ToastGravity.CENTER}) {
    if (msg == '' || msg == null) return;
    if (msg is DioError) {
      
    }
    Fluttertoast.showToast(
      gravity: gravity,
      msg: msg?.message?.toString() ?? msg.toString(),
    );
  }

}