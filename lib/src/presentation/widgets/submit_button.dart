import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/utils/config/size_config.dart';

class SubmitButton extends StatelessWidget {
  String text;
  Function onClickFunction;
  SubmitButton({@required this.text, @required this.onClickFunction});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      child: InkWell(
        onTap: onClickFunction,
        child: Container(
          width: SizeConfig.blockSizeHorizontal * 80,
          height: SizeConfig.blockSizeHorizontal*10,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2),
              ],
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xfffbb448), Color(0xfff7892b)])),
          child: Text(
            text,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}