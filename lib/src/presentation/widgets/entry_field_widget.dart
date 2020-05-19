import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/screens/login_signup_screen.dart';
import 'package:flutter_ecommerce_youtube/src/utils/size_config.dart';
import 'dart:developer' as developer;

final GlobalKey<LoginSignUpScreenState> loginSignUpScreenGlobalKey =
    new GlobalKey<LoginSignUpScreenState>();

class EntryFieldWidget extends StatefulWidget {
  String _title;
  IconData _iconData;
  TextEditingController _textEditingController;
  bool isPassword;
  bool isDigit;
  bool showError;
  bool obscureText;
  EntryFieldWidget(this._title, this._textEditingController, this._iconData,
      {Key key,
      this.isPassword = false,
      this.isDigit = false,
      this.showError = true,
      this.obscureText = true})
      : super(key: key);

  @override
  _EntryFieldWidgetState createState() => _EntryFieldWidgetState();
}

class _EntryFieldWidgetState extends State<EntryFieldWidget> {

  String validationLogic(
    String title,
    TextEditingController text,
    bool isDigit,
    bool isPassword,
  ) {
    // TODO: Optimize the Validation Function
    String textEntered = text.text;
    if (text.text == null || text.text.isEmpty) {
      developer.log("Inside Validation logic TEXT = NULL");
      //loginSignUpScreenGlobalKey.currentState.updateIsButtonDisbaled(true);
      return '$title cannot be empty';
    }
    developer.log("Indise Validation Logic $textEntered ");
    //loginSignUpScreenGlobalKey.currentState.updateIsButtonDisbaled(false);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    setState(
          () {
        widget.obscureText = !widget.obscureText;
      },
    );
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      height: SizeConfig.blockSizeVertical * 2,
      child: TextField(
        controller: widget._textEditingController,
        onChanged: (_text) {
          setState(() {
            widget.showError = true;
          });
        },
        obscureText: widget.isPassword ? widget.obscureText : widget.isPassword,
        keyboardType:
            widget.isDigit ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          helperText: "",
          labelStyle: TextStyle(fontSize: 14),
          hintStyle: TextStyle(fontSize: 14),
          contentPadding: EdgeInsets.all(0),
          labelText: widget._title,
          errorText: widget.showError
              ? validationLogic(widget._title, widget._textEditingController,
                  widget.isDigit, widget.isPassword)
//                    ?  "cannot be empty"
              : null,
          hintText: "Enter Your ${widget._title}",
          prefixIcon: Icon(
            widget._iconData,
            size: SizeConfig.blockSizeHorizontal * 6,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          fillColor: Color(0xfff3f3f4), //
          filled: true,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(widget.obscureText
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                  },
                )
              : null,
        ),
      ),
    );
  }
}
