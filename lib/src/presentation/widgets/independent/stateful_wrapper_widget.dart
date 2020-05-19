import 'package:flutter/material.dart';

class StatefulWrapperWidget extends StatefulWidget {
  final Function onInit;
  final Widget child;


  StatefulWrapperWidget({@required this.onInit, @required this.child});

  @override
  _StatefulWrapperWidgetState createState() => _StatefulWrapperWidgetState();
}

class _StatefulWrapperWidgetState extends State<StatefulWrapperWidget> {

  @override
  void initState(){
    print("On Init inside StatefulWrapperWidget");
    if(widget.onInit!=null){
      widget.onInit;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
