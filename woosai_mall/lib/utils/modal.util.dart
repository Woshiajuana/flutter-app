

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Modal {

  static final Modal _modal = Modal._internal();

  factory Modal () {
    return _modal;
  }

  Modal._internal();

  void toast (msg, {ToastGravity gravity = ToastGravity.CENTER}) {
    if (msg is DioError) {
      msg = msg.message;
    }
    if (msg == '' || msg == null) return;
    Fluttertoast.showToast(
      gravity: gravity,
      msg: msg.toString(),
    );
  }

}