import 'package:flutter/material.dart';

class ConfirmDialog extends StatefulWidget {

  const ConfirmDialog({Key key, this.content}) : super(key: key);

  final String content;

  @override
  _ConfirmDialogState createState() => new _ConfirmDialogState();
}

class _ConfirmDialogState extends State<ConfirmDialog> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      type: MaterialType.transparency,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            width: 256.0,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: new Column(
              children: <Widget>[
                // 输入
                _widgetContent(),
                // 按钮
                _widgetButtonGroup(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _widgetContent () {
    return new Container(
      margin: const EdgeInsets.only(top: 25.0, bottom: 25.0, left: 16.0, right: 16.0),
      child: new Center(
        child: new Text(
          widget.content ?? '',
          style: new TextStyle(
            color: Color(0xff2d2a34),
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  Widget _widgetButtonGroup () {
    return new Container(
      height: 45.0,
      decoration: new BoxDecoration(
        border: new Border(
          top: new BorderSide(
            color: Color(0xfff0f0f0),
            width: 0.8,
          ),
        )
      ),
      child: new Row(
        children: <Widget>[
          _widgetButtonItem(
            text: '取消',
            color: Color(0xff6b6e73),
            border: true,
            onPressed: () => Navigator.of(context).pop(),
          ),
          _widgetButtonItem(
            text: '确认',
            color: Color(0xff3896ff),
            onPressed: () => _handleSure(),
          ),
        ],
      ),
    );
  }

  Widget _widgetButtonItem ({
    String text = '',
    Color color,
    bool border = false,
    dynamic onPressed,
  }) {
    return new Expanded(
      flex: 1,
      child: new FlatButton(
        padding: const EdgeInsets.all(0),
        onPressed: onPressed,
        child: new Container(
          decoration: new BoxDecoration(
            border: border ? new Border(
              right: new BorderSide(
                color: Color(0xfff0f0f0),
                width: 0.8,
              ),
            ) : null,
          ),
          height: 45.0,
          child: new Center(
            child: new Text(
              text,
              style: new TextStyle(
                fontSize: 14.0,
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleSure () async {
    try {
      Navigator.of(context).pop(true);
    } catch (err) {
    }
  }

}
